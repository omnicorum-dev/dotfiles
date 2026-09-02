local shell_buf = nil
local shell_win = nil

local function close_shell()
  if shell_win and vim.api.nvim_win_is_valid(shell_win) then
    vim.api.nvim_win_close(shell_win, true)
  end

  if shell_buf and vim.api.nvim_buf_is_valid(shell_buf) then
    vim.api.nvim_buf_delete(shell_buf, { force = true })
  end

  shell_win = nil
  shell_buf = nil
end

local function append_output(data)
  if not data or data == "" then
    return
  end

  vim.schedule(function()
    if not shell_buf or not vim.api.nvim_buf_is_valid(shell_buf) then
      return
    end

    vim.bo[shell_buf].modifiable = true

    local lines = vim.split(data, "\n", {
      plain = true,
    })

    vim.api.nvim_buf_set_lines(shell_buf, -1, -1, false, lines)

    vim.bo[shell_buf].modifiable = false

    if shell_win and vim.api.nvim_win_is_valid(shell_win) then
      local count = vim.api.nvim_buf_line_count(shell_buf)

      vim.api.nvim_win_set_cursor(shell_win, { math.max(1, count), 0 })
    end
  end)
end

local function shell_command(command)
  close_shell()

  -- Create the scratch buffer.
  shell_buf = vim.api.nvim_create_buf(false, true)

  vim.bo[shell_buf].buftype = "nofile"
  vim.bo[shell_buf].bufhidden = "wipe"
  vim.bo[shell_buf].swapfile = false
  vim.bo[shell_buf].modifiable = false
  vim.bo[shell_buf].filetype = "shell"

  -- Create a split without creating another buffer.
  local current_win = vim.api.nvim_get_current_win()
  local width = vim.api.nvim_win_get_width(current_win)
  local height = math.floor(vim.api.nvim_win_get_height(current_win) * 0.3)

  shell_win = vim.api.nvim_open_win(shell_buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = vim.o.lines - height - vim.o.cmdheight - 1,
    col = 0,
    style = "minimal",
    border = "none",
  })

  vim.wo[shell_win].winblend = 0
  vim.wo[shell_win].wrap = false
  vim.wo[shell_win].number = false
  vim.wo[shell_win].relativenumber = false

  vim.keymap.set("n", "q", close_shell, {
    buffer = shell_buf,
    silent = true,
    desc = "Close shell output",
  })

  vim.keymap.set("n", "<Esc>", close_shell, {
    buffer = shell_buf,
    silent = true,
    desc = "Close shell output",
  })

  local job = vim.system({ vim.o.shell, vim.o.shellcmdflag, command }, {
    text = true,

    stdout = function(_, data)
      append_output(data)
    end,

    stderr = function(_, data)
      append_output(data)
    end,

    on_exit = function(_, code)
      vim.schedule(function()
        if not shell_buf or not vim.api.nvim_buf_is_valid(shell_buf) then
          return
        end

        vim.bo[shell_buf].modifiable = true

        vim.api.nvim_buf_set_lines(shell_buf, -1, -1, false, {
          "",
          "Process exited with code " .. code,
        })

        vim.bo[shell_buf].modifiable = false
      end)
    end,
  })

  vim.keymap.set("n", "<C-c>", function()
    job:kill("sigint")
  end, {
    buffer = shell_buf,
    silent = true,
    desc = "Interrupt shell command",
  })
end

vim.api.nvim_create_user_command("Sh", function(opts)
  shell_command(opts.args)
end, {
  nargs = "+",
  complete = "shellcmd",
  desc = "Run shell command",
})

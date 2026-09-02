#export GLFW_HOME="/opt/homebrew/Cellar/glfw/3.4"
#export GLAD_HOME="/usr/local/include/glad"

#export VULKAN_SDK="/Users/nicorusso/VulkanSDK/vulkan/macOS"
#export PATH=$VULKAN_SDK/bin:$PATH
#export DYLD_LIBRARY_PATH=$VULKAN_SDK/lib:$DYLD_LIBRARY_PATH
#export VK_ICD_FILENAMES=$VULKAN_SDK/share/vulkan/icd.d/MoltenVK_icd.json
#export VK_LAYER_PATH=$VULKAN_SDK/share/vulkan/explicit_layer.d

#source /Users/nicorusso/VulkanSDK/vulkan/setup-env.sh

eval "$(oh-my-posh init zsh --config /opt/homebrew/opt/oh-my-posh/themes/tokyonight_storm.omp.json)"

# 2. zsh completion
autoload -Uz compinit && compinit

# 3. autosuggestions (depends on compinit)
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# 4. syntax highlighting (must be last)
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


export PATH="$HOME/Development/ZES/vendor/z88dk/bin:$PATH"
export ZCCCFG="$HOME/Development/ZES/vendor/z88dk/lib/config"


# ---- COLOR SUPPORT ----
autoload -U colors && colors

# macOS ls colors
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Linux ls colors
alias ls='ls --color=auto'

# Completion colors
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Use vivid for better LS_COLORS (if installed)
# export LS_COLORS="$(vivid generate catppuccin-macchiato)"

# ---- ZSH BEHAVIOR ----
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt CORRECT
setopt EXTENDED_GLOB


# Workaround for FreeBSD SSH in Ghostty
if [[ "$TERM_PROGRAM" == "ghostty" ]]; then
    export TERM=xterm-256color
fi

export PATH="/Library/Frameworks/Python.framework/Versions/3.13/bin:$PATH"

. "$HOME/.local/bin/env"

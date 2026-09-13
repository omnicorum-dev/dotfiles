;; Package archives and use-package bootstrap
(require 'package)
(setq package-archives '(("melpa"  . "https://melpa.org/packages/")
                          ("gnu"    . "https://elpa.gnu.org/packages/")
                          ("nongnu" . "https://elpa.nongnu.org/nongnu/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
 
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; UX cleanup
(setq inhibit-startup-message t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)
(setq make-backup-files nil)
(setq auto-save-default nil)
(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)
(global-auto-revert-mode t)
(setq ring-bell-function 'ignore)

(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'super)
(setq mac-control-modifier 'control)

(set-face-attribute 'default nil :font "JetBrains Mono" :height 200)

(setq-default indent-tabs-mode nil)
(global-so-long-mode 1)
(setq confirm-kill-emacs 'y-or-n-p)
(delete-selection-mode 1)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'gruber-darker t)

(electric-pair-mode 1)

;; vterm
(use-package vterm)

;; dashboard
(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  :custom
  (dashboard-startup-banner '("~/.emacs.d/banners/1.txt" "~/.emacs.d/banners/2.txt" "~/.emacs.d/banners/3.txt" "~/.emacs.d/banners/4.txt"))
  (dashboard-center-content t)
  (dashboard-vertically-center-content t)
  (dashboard-items '((recents  . 5)
                      (bookmarks . 5)
                      (projects . 5)
                      (agenda . 5)))
  (dashboard-set-heading-icons t)
  (dashboard-set-file-icons t)
  (dashboard-set-navigator t))

;; Evil mode
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-undo-system 'undo-fu)
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode 1))
 
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))
 
(use-package undo-fu)

(use-package evil-mc
  :after evil
  :config (global-evil-mc-mode 1))

(global-set-key (kbd "C-c e") 'evil-mode)

(global-set-key (kbd "s-<return>") 'toggle-frame-fullscreen)

;; leader key and which-key
(use-package general
  :after evil
  :config
  (general-create-definer my-leader
    :states '(normal visual)
    :prefix "SPC")
 
  (my-leader
    "f"  '(:ignore t :which-key "find")
    "ff" 'consult-find
    "fg" 'consult-ripgrep
    "fs" 'save-buffer
    "fr" 'consult-recent-file
 
    "b"  '(:ignore t :which-key "buffer")
    "bb" 'consult-buffer
    "bk" 'kill-this-buffer
 
    "p"  '(:ignore t :which-key "project")
    "pf" 'projectile-find-file
    "pp" 'projectile-switch-project

    "w"  '(:ingnore t :which-key "window")
    "wv" 'split-window-right
    "|"  'split-window-right
    "ws" 'split-window-below
    "%"  'split-window-below
    "wd" 'delete-window
    "wo" 'delete-other-windows

    "m"  '(:ignore t :which-key "multiple-cursors")
    "mj" 'evil-mc-make-cursor-move-next-line
    "mk" 'evil-mc-make-cursor-move-prev-line
    "mn" 'evil-mc-make-and-goto-next-match
    "mp" 'evil-mc-make-and-goto-prev-match
    "mc" 'evil-mc-undo-all-cursors

    "g"  '(:ignore t :which-key "goto")
    "gd" 'xref-find-definitions
    "gi" 'eglot-find-implementation
    "gr" 'xref-find-references
    "gt" 'eglot-find-typeDefinition
    "gI" 'xref-find-definitions-other-window

    "dd" 'dired

    "od" 'dashboard-open

    "tt" 'vterm

    "."  'find-file

    "bi" 'ibuffer
 
    "gg" 'magit-status

    "cc" 'compile

    ":"  'execute-extended-command
 
    "e"  'eglot-format-buffer
    "ca" 'eglot-code-actions
    "rn" 'eglot-rename))

(general-define-key
  :states '(normal visual)
  "]b" 'next-buffer
  "[b" 'previous-buffer)

(general-define-key
  :states '(normal visual)
  "]t" 'tab-next
  "[t" 'tab-previous)
 
(use-package which-key
  :config
  (which-key-mode))

(with-eval-after-load 'dired
  (evil-collection-define-key 'normal 'dired-mode-map
    "r" 'wdired-change-to-wdired-mode))

;; Completion
(use-package vertico
  :init (vertico-mode))
 
(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))
 
(use-package consult)
 
(use-package marginalia
  :init (marginalia-mode))
 
(use-package corfu
  :init (global-corfu-mode)
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0.1)
  (corfu-auto-prefix 1))

;; LSP
(use-package typescript-mode
  :mode "\\.ts\\'")

(use-package cmake-mode
  :mode "CMakeLists\\.txt\\'\\|\\.cmake\\'")

(use-package rust-mode
  :mode "\\.rs\\'")

(use-package web-mode
  :mode "\\.html\\'\\|\\.css\\'\\|\\.jsx\\'\\|\\.tsx\\'")

(use-package lua-mode
  :mode "\\.lua\\'")

(use-package eglot
  :hook ((python-mode . eglot-ensure)
         (js-mode     . eglot-ensure)
         (typescript-mode . eglot-ensure)
         (c-mode      . eglot-ensure)
         (c++-mode    . eglot-ensure)
         (cmake-mode . eglot-ensure)
         (rust-mode . eglot-ensure)
         (web-mode . eglot-ensure)
         (sh-mode . eglot-ensure)
         (lua-mode . eglot-ensure)))

(use-package treesit-auto
  :config
  (global-treesit-auto-mode))

;; Project management
(use-package projectile
  :init (projectile-mode)
  :bind-keymap ("C-c p" . projectile-command-map))

;; other useful shit
(use-package exec-path-from-shell
  :config (when (memq window-system '(mac ns)) (exec-path-from-shell-initialize)))

(use-package gcmh
  :config (gcmh-mode 1))

(use-package org-roam
  :custom
  (org-roam-directory (file-truename "~/org"))
  :config
  (org-roam-db-autosync-mode))

(use-package pdf-tools
  :magic ("%PDF" . pdf-view-mode) 
  :config (pdf-tools-install :no-query))
(pdf-tools-install)

(use-package emms
  :ensure t)

(use-package minesweeper
  :ensure t)

(use-package tramp
  :ensure nil
  :config
  (setq tramp-default-method "ssh"))
 
(use-package magit)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(magit projectile treesit-auto corfu marginalia consult orderless vertico which-key general undo-fu evil-collection evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

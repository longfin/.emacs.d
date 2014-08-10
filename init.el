(require 'cl)

(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)

(setq init-loader-show-log-after-init 'error-only)
(init-loader-load "~/.emacs.d/inits")

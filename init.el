(require 'cl)

(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)

(init-loader-load "~/.emacs.d/inits")

(iswitchb-mode t)
(global-undo-tree-mode t)

(autoload 'jedi:setup "jedi" nil t)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)

(set-default 'ac-sources
             '(ac-source-abbrev
               ac-source-dictionary
               ac-source-words-in-buffer
               ac-source-words-in-same-mode-buffers))
(ac-config-default)
(global-auto-complete-mode t)

(require 'flymake-python-pyflakes)
(setq flymake-python-pyflakes-executable "flake8")
(setq flymake-cursor-mode 't)
(setq column-number-mode t)
(global-auto-revert-mode t)


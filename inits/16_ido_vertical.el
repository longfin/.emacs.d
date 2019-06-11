(use-package ido-vertical-mode
  :ensure t)
(use-package flx-ido
  :ensure t
  :config
  (ido-vertical-mode)
  (flx-ido-mode)
  (setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right))


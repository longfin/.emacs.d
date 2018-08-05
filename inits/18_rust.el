(use-package rust-mode
  :mode "\\.rs\\'"
  :bind ("TAB" . company-indent-or-complete-common)

  :init
  (add-hook 'rust-mode-hook 'racer-mode)
  (add-hook 'racer-mode-hook 'eldoc-mode)
  (add-hook 'rust-mode-hook 'company-mode)
  (add-hook 'rust-mode-hook 'flycheck-mode)
  (add-hook 'rust-mode-hook 'cargo-minor-mode)
  (with-eval-after-load 'rust-mode
      (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

  :config
;;  (setq rust-format-on-save t)
  (setq company-tooltip-align-annotations t))

(defun my/web-mode-hook ()
  (add-to-list 'company-backends 'company-web-html))

(use-package web-mode
  :ensure t
  :hook ('my/web-mode-hook 'emmet-mode)
  :config
  (add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
  (setq web-mode-markup-indent-offset 2))

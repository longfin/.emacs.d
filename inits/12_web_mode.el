(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(setq web-mode-markup-indent-offset 2)


(defun my/web-mode-hook ()
  (add-to-list 'company-backends 'company-web-html))

(add-hook 'web-mode-hook 'my/web-mode-hook)
(add-hook 'web-mode-hook 'emmet-mode)

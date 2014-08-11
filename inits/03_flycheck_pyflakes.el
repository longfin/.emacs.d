(add-hook 'flycheck-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-c n")
                            'flycheck-next-error)))
(add-hook 'flycheck-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-c p")
                            'flycheck-goto-prev-error)))
(add-hook 'python-mode-hook 'flycheck-mode)

(add-hook 'gtags-mode-hook
          (lambda ()
            (local-set-key (kbd "M-.") 'gtags-find-tag)
            (local-set-key (kbd "M-,") 'gtags-pop-stack)))

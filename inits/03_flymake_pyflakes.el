(add-hook 'flymake-mode-hook
		  '(lambda ()
			 (local-set-key (kbd "C-c n")
							'flymake-goto-next-error)))
(add-hook 'flymake-mode-hook
		  '(lambda ()
			 (local-set-key (kbd "C-c p")
							'flymake-goto-prev-error)))
(setq flymake-python-pyflakes-extra-arguments '("--ignore=E711"))
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)

(add-hook 'markdown-mode-hook
		  '(lambda ()
			 (setq c-basic-offset 4)
			 (setq tab-width 4)))

(setq markdown-command "pandoc -f markdown_github")

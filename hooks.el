(add-hook 'eshell-mode-hook
	  '(lambda nil
	     (eshell/export "LANG=ko_KR.UTF-8")))

(add-hook 'scheme-mode-hook '(lambda ()
      (local-set-key (kbd "RET") 'newline-and-indent)))

(add-hook 'js-mode-hook
          '(lambda()
             (setq c-basic-offset 4)
			 (setq js-indent-level 4)
             (setq tab-width 4)))

(add-hook 'java-mode-hook
		  (lambda ()
			"Treat Java 1.5 @-style annotations as comments."
			(setq c-comment-start-regexp "(@|/(/|[*][*]?))")
			(modify-syntax-entry ?@ "< b" java-mode-syntax-table)))

(add-hook 'java-mode-hook
		  (lambda ()
			(setq c-basic-offset 4
				  tab-width 4)))

(add-hook 'css-mode-hook 
          '(lambda()
             (setq c-basic-offset 2)
             (setq tab-width 2)
			 (setq css-indent-offset 2)
			 (auto-complete-mode 1)))

(add-hook 'markdown-mode-hook
		  '(lambda ()
			 (setq c-basic-offset 4)
			 (setq tab-width 4)))

(defun iswitchb-local-keys ()
  (mapc (lambda (K) 
	      (let* ((key (car K)) (fun (cdr K)))
			(define-key iswitchb-mode-map (edmacro-parse-keys key) fun)))
	    '(("<right>" . iswitchb-next-match)
	      ("<left>"  . iswitchb-prev-match)
	      ("<up>"    . ignore             )
	      ("<down>"  . ignore             ))))
(add-hook 'iswitchb-define-mode-map-hook 'iswitchb-local-keys)


(add-hook 'sgml-mode-hook
		  '(lambda()
			 (zencoding-mode)))

(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(add-hook 'c-mode-hook
          '(lambda()
             (setq c-basic-offset 2)))

(add-hook 'c++-mode-hook
          '(lambda()
             (setq c-basic-offset 2)))

(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)
(add-hook 'flymake-mode-hook
		  '(lambda ()
			 (local-set-key (kbd "C-c n")
							'flymake-goto-next-error)))
(add-hook 'flymake-mode-hook
		  '(lambda ()
			 (local-set-key (kbd "C-c p")
							'flymake-goto-prev-error)))
(setq flymake-python-pyflakes-extra-arguments '("--ignore=E711"))


(setq ansi-color-names-vector ; better contrast colors
      ["black" "red4" "green4" "yellow4"
       "blue3" "magenta4" "cyan4" "white"])
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)


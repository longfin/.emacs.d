(set-language-environment "UTF-8")
(set-terminal-coding-system 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)

(iswitchb-mode t)

(defun iswitchb-local-keys ()
  (mapc (lambda (K)
	      (let* ((key (car K)) (fun (cdr K)))
			(define-key iswitchb-mode-map (edmacro-parse-keys key) fun)))
	    '(("<right>" . iswitchb-next-match)
	      ("<left>"  . iswitchb-prev-match)
	      ("<up>"    . ignore             )
	      ("<down>"  . ignore             ))))
(add-hook 'iswitchb-define-mode-map-hook 'iswitchb-local-keys)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

(setq inhibit-splash-screen t)
(set-language-environment "UTF-8")

(custom-set-faces
 '(default ((t (:inherit nil :stipple nil :background "#fcf4dc" :foreground "#52676f" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "apple" :family "NanumGothicCoding")))))

(color-theme-initialize)
(color-theme-solarized-light)

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

(setq ansi-color-names-vector ; better contrast colors
      ["black" "red4" "green4" "yellow4"
       "blue3" "magenta4" "cyan4" "white"])
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(column-number-mode t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)

(setq make-backup-files nil)
(setq ring-bell-function 'ignore)

;; Setup PATH
(setenv "PATH" (shell-command-to-string "source ~/.bashrc; echo -n $PATH"))
;; Update exec-path with the contents of $PATH
(loop for path in (split-string (getenv "PATH") ":") do
      (add-to-list 'exec-path path))


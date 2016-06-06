(global-set-key [C-kanji] 'set-mark-command)
(set-language-environment "UTF-8")
(set-terminal-coding-system 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(setq tab-width 4)
(setq-default indent-tabs-mode nil)
(set-input-method 'korean-hangul)

(icomplete-mode t)

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
			 (setq css-indent-offset 2)))

(setq ansi-color-names-vector ; better contrast colors
      ["black" "red4" "green4" "yellow4"
       "blue3" "magenta4" "cyan4" "white"])
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(column-number-mode t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(scroll-bar-mode -1)

(setq make-backup-files nil)
(setq create-lockfiles nil)
(setq ring-bell-function 'ignore)

;; Setup PATH
(if (not (eq system-type 'windows-nt))
    (progn
      (setenv "PATH" (shell-command-to-string "source ~/.bashrc; echo -n $PATH"))
      (loop for path in (split-string (getenv "PATH") ":") do
            (add-to-list 'exec-path path))))


(defun clear-shell ()
  (interactive)
  (let ((comint-buffer-maximum-size 0))
    (comint-truncate-buffer)))


(global-set-key (kbd "M-<up>") 'windmove-up)
(global-set-key (kbd "M-<down>") 'windmove-down)
(global-set-key (kbd "M-<left>") 'windmove-left)
(global-set-key (kbd "M-<right>") 'windmove-right)

(global-set-key (kbd "C-s-h") 'shrink-window-horizontally)
(global-set-key (kbd "C-s-l") 'enlarge-window-horizontally)
(global-set-key (kbd "C-s-j") 'previous-multiframe-window)
(global-set-key (kbd "C-s-k") 'next-multiframe-window)


(when (member "나눔고딕코딩" (font-family-list))
  (set-face-attribute 'default nil :font "나눔고딕코딩"))


(setq gnus-button-url 'browse-url-generic
      browse-url-generic-program "google-chrome"
      browse-url-browser-function gnus-button-url)

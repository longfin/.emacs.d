(setq make-backup-files nil)

;; Setup PATH
(setenv "PATH" (shell-command-to-string "source ~/.bashrc; echo -n $PATH"))
;; Update exec-path with the contents of $PATH
(loop for path in (split-string (getenv "PATH") ":") do
      (add-to-list 'exec-path path))

(setq ring-bell-function 'ignore)

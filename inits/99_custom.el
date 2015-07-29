(defun delete-this-buffer-and-file ()
  "Removes file connected to current buffer and kills buffer."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (when (yes-or-no-p "Are you sure you want to remove this file? ")
        (delete-file filename)
        (kill-buffer buffer)
        (message "File '%s' successfully removed" filename)))))
(global-set-key (kbd "C-c k") 'delete-this-buffer-and-file)


(defun xah-syntax-color-hex ()
  "Syntax color hex color spec such as 「#ff1100」 in current buffer."
  (interactive)
  (font-lock-add-keywords
   nil
   '(("#[abcdef[:digit:]]\\{6\\}"
      (0 (put-text-property
          (match-beginning 0)
          (match-end 0)
          'face (list :background (match-string-no-properties 0)))))))
  (font-lock-fontify-buffer)
  )

(defun eshell/clear ()
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))



;;; capnp-mode.el --- major mode for editing Capn' Proto Files

;; This is free and unencumbered software released into the public domain.

;; Author: Brian Taylor <el.wubo@gmail.com>
;; Version: 1.0.0

;;; Commentary:

;; Provides basic syntax highlighting for capnp files.
;;
;; To use:
;;
;; Add something like this to your .emacs file:
;;
;; (add-to-list 'load-path "~/src/capnproto/highlighting/emacs")
;; (require 'capnp-mode)
;; (add-to-list 'auto-mode-alist '("\\.capnp\\'" . capnp-mode))
;;

;;; Code:

;; command to comment/uncomment text
(defun capnp-comment-dwim (arg)
  "Comment or uncomment current line or region in a smart way.
For detail, see `comment-dwim'."
  (interactive "*P")
  (require 'newcomment)
  (let (
        (comment-start "#") (comment-end "")
        )
    (comment-dwim arg)))

(defvar capnp--syntax-table
  (let ((syn-table (make-syntax-table)))

    ;; bash style comment: “# …”
    (modify-syntax-entry ?# "< b" syn-table)
    (modify-syntax-entry ?\n "> b" syn-table)

    syn-table)
  "Syntax table for `capnp-mode'.")

(defvar capnp--keywords
  '("struct" "enum" "interface" "union" "import"
    "using" "const" "annotation" "extends" "in"
    "of" "on" "as" "with" "from" "fixed")
  "Keywords in `capnp-mode'.")

(defvar capnp--types
  '("union" "group" "Void" "Bool" "Int8" "Int16"
    "Int32" "Int64" "UInt8" "UInt16" "UInt32"
    "UInt64" "Float32" "Float64" "Text" "Data"
    "AnyPointer" "AnyStruct" "Capability" "List")
  "Types in `capnp-mode'.")

(defvar capnp--font-lock-keywords
  `(
    (,(regexp-opt capnp--keywords 'words) . font-lock-keyword-face)
    (,(regexp-opt capnp--types 'words) . font-lock-type-face)
    ("@\\w+" . font-lock-constant-face))
  "Font lock definitions in `capnp-mode'.")

;;;###autoload
(define-derived-mode capnp-mode prog-mode
  "capn-mode is a major mode for editing capnp protocol files"
  :syntax-table capnp--syntax-table

  (setq font-lock-defaults '((capnp--font-lock-keywords)))


  (setq mode-name "capnp")
  (define-key capnp-mode-map [remap comment-dwim] 'capnp-comment-dwim))

(provide 'capnp-mode)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
'("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
(package-refresh-contents)
(package-install 'use-package))

(require 'cl)
(require 'bind-key)
(use-package magit :ensure t)
(use-package init-loader
  :ensure t
  :config
  (setq init-loader-show-log-after-init 'error-only)
  (setq init-loader-byte-compile t)
  (init-loader-load "~/.emacs.d/inits"))

(put 'erase-buffer 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(compilation-message-face 'default)
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   '("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "c382e5508237e176c150b9d4b4a78c4e1699fe1c51ec8c86816cbf42532443dd" "c930c2865c39135018cfd3b00bc3971c9990e1bef467558f195c3f036cc506de" "4f2ede02b3324c2f788f4e0bad77f7ebc1874eff7971d2a2c9b9724a50fb3f65" "0928c3609728401c5b12f7c9f4a34f57af680aecba23532f6d29a0f611f1af9d" "1c57936ffb459ad3de4f2abbc39ef29bfb109eade28405fa72734df1bc252c13" "923faef2c7ed017e63f517703c846c6190c31400261e8abdb1be06d5b46ea19a" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a772eafba4eda0ed57a5d651a96804487a1dacbfbf8658084bfe84546a7c7008" default))
 '(default-input-method "korean-hangul")
 '(fci-rule-color "#eee8d5")
 '(highlight-changes-colors '("#d33682" "#6c71c4"))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#fdf6e3" 0.25)
    '("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2")))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
   '(("#eee8d5" . 0)
     ("#B4C342" . 20)
     ("#69CABF" . 30)
     ("#69B7F0" . 50)
     ("#DEB542" . 60)
     ("#F2804F" . 70)
     ("#F771AC" . 85)
     ("#eee8d5" . 100)))
 '(hl-bg-colors
   '("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342"))
 '(hl-fg-colors
   '("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3"))
 '(magit-diff-use-overlays nil)
 '(magit-use-overlays nil)
 '(muse-project-alist nil)
 '(package-selected-packages
   '(company-mode global-company-mode solarized-dark color-theme-solarized dash-functional emmet-mode find-file-in-project highlight-indentation jedi-core json-reformat json-snatcher magit-popup markup-faces oauth pcache popup python-environment pythonic pyvenv queue rust-mode skewer-mode spinner tablist tracking web-completion-data websocket with-editor yasnippet yaxception magit flymake-rust racer exercism haskell-mode haskell-emacs flx company cider flycheck-rust company-racer jedi zencoding-mode yaml-mode yagist windresize web-mode web weather wc-mode vkill virtualenvwrapper undo-tree swiper swift-mode sql-indent splitter sphinx-doc solarized-theme sokoban slime-clj slack scss-mode scala-mode sass-mode restclient redo+ rainbow-delimiters rainbow-blocks qml-mode python-pylint python-pep8 python-mode pymacs pyflakes pyenv-mode protobuf-mode projectile pkgbuild-mode pep8 paredit pallet nsis-mode nodejs-repl nlinum nginx-mode muse multiple-cursors multi-web-mode multi-term multi-eshell markdown-mode+ mark-multiple magit-gh-pulls lui lua-mode levenshtein less-css-mode lcs kv keychain-environment jsx-mode json-mode jinja2-mode ipython init-loader ido-vertical-mode highlight-parentheses heroku-theme heroku hackernews gtags go-mode github-theme git-gutter gist ghci-completion ghc gh-md ggtags geiser flycheck-pyflakes flycheck-google-cpplint flx-ido flappymacs elpy ecb dropbox dockerfile-mode direx dired-single dired+ csv-mode company-web company-jedi company-flx company-emoji coffee-mode clojurescript-mode clojure-quick-repls cljdoc caskxy cargo bufshow aws-ec2 auto-complete-rst auctex android-mode anaphora ag adoc-mode ack ac-nrepl ac-js2 ac-html-bootstrap ac-html ac-emmet ac-cider 4clojure))
 '(pdf-tools-enabled-modes
   '(pdf-history-minor-mode pdf-isearch-minor-mode pdf-links-minor-mode pdf-misc-minor-mode pdf-outline-minor-mode pdf-misc-size-indication-minor-mode pdf-misc-menu-bar-minor-mode pdf-annot-minor-mode pdf-sync-minor-mode pdf-misc-context-menu-minor-mode pdf-cache-prefetch-minor-mode pdf-view-auto-slice-minor-mode pdf-occur-global-minor-mode))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   '((20 . "#dc322f")
     (40 . "#c85d17")
     (60 . "#be730b")
     (80 . "#b58900")
     (100 . "#a58e00")
     (120 . "#9d9100")
     (140 . "#959300")
     (160 . "#8d9600")
     (180 . "#859900")
     (200 . "#669b32")
     (220 . "#579d4c")
     (240 . "#489e65")
     (260 . "#399f7e")
     (280 . "#2aa198")
     (300 . "#2898af")
     (320 . "#2793ba")
     (340 . "#268fc6")
     (360 . "#268bd2")))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   '(unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

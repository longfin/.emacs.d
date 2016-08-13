(require 'slack)

(setq slack-buffer-emojify t) ;; if you want to enable emoji, default nil
(setq slack-prefer-current-team t)
(slack-register-team
 :name "Spoqa"
 :default t
 :client-id "2162629205.48516658787"
 :client-secret "ba0a600529edc7d3b050842ec4d9e9da"
 :token "xoxp-2162629205-2162776842-48557253894-a5ecbbd3bf")

(slack-register-team
 :name "algospot-study"
 :client-id "22311057795.48555320246"
 :client-secret "cdcd8a19a0bc54ef3d48bf2fd8f439c0"
 :token "xoxp-22311057795-22314900193-48563436343-68c4ec9fb1")

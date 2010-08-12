;; load dark laptop color theme
(color-theme-dark-laptop)

;; set misc settings
(setq visible-bell nil)

;; remove hl-mode hook
(remove-hook 'coding-hook 'turn-on-hl-line-mode)

;; Set this to whatever browser you use
;;(setq browse-url-browser-function 'browse-url-firefox)
(setq browse-url-browser-function 'browse-default-macosx-browser)
;;(setq browse-url-browser-function 'browse-url-generic
;;      browse-url-generic-program "~/src/conkeror/conkeror")


;; org mode experimentation
(setq org-log-done t)

;; allow narrowing
(put 'narrow-to-region 'disabled nil)

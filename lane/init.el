;; set path
(setenv "PATH" "/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/Users/lane/dev/lein-stable:/Users/lane/dev/leiningen/bin:/Users/lane/.rvm/bin")

;; set misc settings
(setq visible-bell nil)
(setq column-number-mode t)
(setq ispell-program-name "aspell")
(setq ispell-list-command "list")
(setq ispell-extra-args '("--sug-mode=ultra"))

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

;; don't display scratch buffer message
(setq initial-scratch-message "")

;; set mysql client output to vertical instead of table
(setq sql-mysql-options (list "-E"))

;; swap command/options keys in mac os x
(when (eq system-type 'darwin) 
  (setq mac-option-key-is-meta nil)
  (setq mac-command-key-is-meta t)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier nil))

;; put the replace regexp commands at your fingertips!
(defalias 'rr 'replace-regexp)
(defalias 'qrr 'query-replace-regexp)

;; don't wrap lines in partial width windows
(setq truncate-partial-width-windows t)

;; custom functions
(defun longest-line-length ()
  "Returns the length of the longest line in the current buffer.
If called interactively, a message is printed in the echo area,
otherwise just the length is returned."
  (interactive)
  (let (longest-line)
    (save-excursion
      (goto-char (point-min))
      (end-of-line)
      (setq longest-line (current-column))
      (while (< (forward-line 1) 1)
        (end-of-line)
        (if (> (current-column) longest-line)
            (setq longest-line (current-column))))
      (if (called-interactively-p)
          (message "Longest line length: %d" longest-line)))
    longest-line))

(defun mark-buffer-as-rectangle ()
  "Puts mark at beginning of current buffer and moves point
to the last line and column needed to capture all lines in 
the buffer as a rectangle. Appends spaces to the last line
as needed to match the length of the longest line."
  (interactive)
  (let ((longest-line (longest-line-length)))
    (goto-char (point-min))
    (push-mark)
    (goto-char (point-max))
    (while (< (current-column) (+ longest-line 1))
      (insert " "))))

;; TODO
(defun kill-rectangle-save ()
  "Save the rectangle as if killed with kill-rectangle, but
don't delete it.")


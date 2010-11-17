;; hybris specific functions
(defun impexinate-region (start end)
  "Replaces beginning of line and all tab characters with semicolons in the region"
  (interactive "r")
  (save-restriction
    (narrow-to-region start end)
    (goto-char (point-min))
    (while (re-search-forward "^" nil t)
      (replace-match ";"))
    (goto-char (point-min))
    (while (re-search-forward "	" nil t)
      (replace-match ";"))))

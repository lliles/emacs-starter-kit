;; final init file after all others in directory have been loaded

;; symlinked files for easier git updating
;; durendal.el  -> ../../durendal/durendal.el
;; rvm.el       -> ../../rvm.el/rvm.el

;; load dark laptop color theme
(color-theme-dark-laptop)

;; enable durendal
(durendal-enable)

;; enable rvm.el
(rvm-use-default)


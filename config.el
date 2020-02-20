;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; refresh' after modifying this file!


;; These are used for a number of things, particularly for GPG configuration,
;; some email clients, file templates and snippets.
(setq user-full-name "Kyle Humphrey"
      user-mail-address "khumph2@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(when (string-equal system-type "windows-nt")
  (setq doom-font "Consolas-12"))
(when (string-equal system-type "darwin")
  (setq doom-font "Fira Mono-14"))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. These are the defaults.
(when (string-equal system-type "windows-nt")
  (setq doom-theme 'doom-opera-light))
(when (string-equal system-type "darwin")
  (setq doom-theme 'doom-opera-light))

;; If you intend to use org, it is recommended you change this!
(setq org-directory "~/org")
(setq org-archive-location '"~/org/archive/a-%s::datetree/* Archived Tasks")

;; Org options
(add-to-list 'org-modules 'org-checklist)
(setq org-agenda-window-setup 'current-window)
(setq org-enforce-todo-dependencies t)
(setq org-enforce-todo-checkbox-dependencies t)
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-show-future-repeats 'next)
(setq org-log-done 'time)
(setq org-log-into-drawer t)

;(setq org-agenda-files (list "~/Dropbox/org"))
(setq org-tag-alist '((:startgroup . nil)
                     ("fusion" . ?f) ("home" . ?h) ("out" . ?o) ("work" . ?w)
                     (:endgroup . nil)
                     (:startgroup . nil)
                     ("shallow" . ?s) ("deep" . ?d) ("event" . ?e)
                     (:endgroup . nil)))
(setq org-tags-column 0)
(setq org-todo-keywords
  '((sequence "TODO(t)" "|" "DONE(d)")
    (sequence "WAITING(w@/!)" "MAYBE(m!)" "|")
    (sequence "|" "CANCELLED(c@)")))

;; Omit non-US holidays
(setq holiday-bahai-holidays nil)
(setq holiday-hebrew-holidays nil)
(setq holiday-islamic-holidays nil)

;; If you want to change the style of line numbers, change this to `relative' or
;; `nil' to disable it:
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', where Emacs
;;   looks when you load packages with `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

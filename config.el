;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; refresh' after modifying this file!
;;

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
(if (string-equal system-type "darwin")
  (setq doom-font "JetBrains Mono-13")
  (setq doom-font "JetBrains Mono-11"))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. These are the defaults.
(if (string-equal system-type "gnu/linux")
  (setq doom-theme 'doom-one)
  (setq doom-theme 'doom-opera-light))


;; Org roam options
(when (string-equal system-type "darwin")
  (setq org-roam-directory "~/org-roam"
        org-roam-graph-viewer "/usr/bin/open"
        org-roam-capture-templates
        '(("d" "default" plain
           (function org-roam-capture--get-point)
           "%?"
           :file-name "${slug}"
           :head "#+TITLE: ${title}\n#+CREATED: %U\n#+LAST_MODIFIED: %U\n\n"
           :unnarrowed t)))

  (after! org-roam
    (map! :leader
          :prefix "n"
          :desc "org-roam" "l" #'org-roam
          :desc "org-roam-insert" "i" #'org-roam-insert
          :desc "org-roam-switch-to-buffer" "b" #'org-roam-switch-to-buffer
          :desc "org-roam-find-file" "f" #'org-roam-find-file
          :desc "org-roam-show-graph" "g" #'org-roam-show-graph
          :desc "org-roam-insert" "i" #'org-roam-insert
          :desc "org-roam-capture" "c" #'org-roam-capture))

  (setq deft-recursive t
        deft-use-filter-string-for-filename t
        deft-default-extension "org"
        deft-directory org-roam-directory)
)

;; Org options
(if (string-equal system-type "windows-nt")
    (setq home "~/OneDrive - Cytel")
    (setq home "~/Dropbox"))

(after! org
  (auto-fill-mode -1)
  (visual-line-mode 1))
(add-to-list 'org-modules 'org-checklist)
(setq org-directory (concat (file-name-as-directory home) "org")
      org-archive-location (concat (file-name-as-directory home) "org-archive/%s-a::datetree/* Archived Tasks")
      org-agenda-skip-scheduled-if-done t
      org-agenda-skip-deadline-if-done t
      org-agenda-show-future-repeats nil
      org-enforce-todo-checkbox-dependencies t
      org-log-done 'time
      org-log-into-drawer t
      org-priority-highest 1
      org-priority-lowest 6
      org-priority-default 4
      org-tags-column 0
      org-tag-alist '((:startgroup . context)
                      ("@fusion" . ?f) ("@home" . ?h) ("@out" . ?o) ("@work" . ?w)
                      (:endgroup . context)
                      (:startgroup . nil)
                      ("pers" . ?p) ("work" . ?r)
                      (:endgroup . nil)
                      (:startgroup . depth)
                      ("shallow" . ?s) ("deep" . ?d)
                      (:endgroup . depth)))


;; If you want to change the style of line numbers, change this to `relative' or
;; `nil' to disable it:
(setq display-line-numbers-type nil)
(auto-save-visited-mode +1)


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

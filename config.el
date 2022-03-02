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
  (setq doom-font "JetBrains Mono-10"))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. These are the defaults.
(if (string-equal system-type "gnu/linux")
  (setq doom-theme 'doom-one)
  (setq doom-theme 'doom-opera-light))

;; Start emacs maximized
;; (add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Delete by moving to trash
(setq delete-by-moving-to-trash t)

;; Org options
(after! org
  (if (string-equal system-type "windows-nt")
      (setq home "~/OneDrive - Cytel")
      (setq home "~/Dropbox"))

  (auto-fill-mode -1)
  (visual-line-mode 1)
  (add-to-list 'org-modules 'org-checklist)
  (setq org-directory (concat (file-name-as-directory home) "org")
        org-agenda-files (list (concat (file-name-as-directory org-directory) "pers")
                               (concat (file-name-as-directory org-directory) "axio")
                               (file-name-as-directory org-directory))
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
                        ("@home" . ?h) ("@out" . ?o)
                        (:endgroup . context)
                        (:startgroup . nil)
                        ("pers" . ?p) ("work" . ?w)
                        (:endgroup . nil)
                        (:startgroup . depth)
                        ("shallow" . ?s) ("deep" . ?d)
                        (:endgroup . depth))))


(if IS-MAC
    (after! org
      (setq org-cite-global-bibliography (list (expand-file-name (concat (file-name-as-directory home) "library.bib"))))

      ;; Org roam options
      (after! org-roam
        (setq org-roam-directory (concat (file-name-as-directory home) "org-roam")
              org-roam-graph-viewer "/usr/bin/open"
              org-roam-capture-templates
              '(("d" "default" plain
                 "%?"
                 :target (file+head "${slug}.org" "#+TITLE: ${title}\n#+CREATED: %U\n#+LAST_MODIFIED: %U\n\n")
                 :unnarrowed t))

              deft-recursive t
              org-roam-completion-everywhere t
              deft-use-filter-string-for-filename t
              deft-default-extension "org"
              deft-directory org-roam-directory

              org-roam-mode-section-functions
              (list #'org-roam-backlinks-section
                    #'org-roam-reflinks-section)))

      (use-package! websocket
        :after org-roam)

      (use-package! org-roam-ui
        :after org-roam ;; or :after org
        ;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
        ;;         a hookable mode anymore, you're advised to pick something yourself
        ;;         if you don't care about startup time, use
        ;;  :hook (after-init . org-roam-ui-mode)
        :config
        (setq org-roam-ui-sync-theme t
              org-roam-ui-follow t
              org-roam-ui-update-on-save t
              org-roam-ui-open-on-start t))

      (use-package! org-roam-timestamps
        :after org-roam
        :config (org-roam-timestamps-mode))))

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
;;
;; (defun native-comp-available-p nil)

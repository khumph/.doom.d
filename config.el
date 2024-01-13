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
(setq doom-font (font-spec :family "JetBrains Mono" :size 13))
(setq doom-variable-pitch-font (font-spec :family "Literata" :size 13))
(custom-set-faces!
  '(font-lock-comment-face :slant italic))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. These are the defaults.
(setq doom-theme 'doom-opera-light)

;; Use normal size title bar in macOS Sonoma
;; https://github.com/doomemacs/doomemacs/issues/7532
(add-hook 'doom-after-init-hook (lambda () (tool-bar-mode 1) (tool-bar-mode 0)))

;; Set defaults
(setq-default
 delete-by-moving-to-trash t                      ; Delete files to trash
 window-combination-resize t                      ; take new window space from all other windows (not just current)
 x-stretch-cursor t)                              ; Stretch cursor to the glyph width

(setq undo-limit 80000000                         ; Raise undo-limit to 80Mb
      ;; evil-want-fine-undo t                       ; By default while in insert all changes are one big blob. Be more granular
      truncate-string-ellipsis "…"                ; Unicode ellispis are nicer than "...", and also save /precious/ space
      password-cache-expiry nil                   ; I can trust my computers ... can't I?
      ;; scroll-preserve-screen-position 'always     ; Don't have `point' jump around
      scroll-margin 2)                            ; It's nice to maintain a little margin

;; Org options
(after! org
  (auto-fill-mode -1)
  (visual-line-mode 1)
  (add-to-list 'org-modules 'org-checklist)
  (setq org-directory "~/org"
        org-archive-location "~/Documents/org-archive/archive.org::* %s"
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
        org-todo-repeat-to-state t
        +org-capture-journal-file "journal.org"
        org-tag-alist '((:startgroup . context)
                        ("@home" . ?h) ("@out" . ?o)
                        (:endgroup . context)
                        (:startgroup . nil)
                        ("pers" . ?p) ("work" . ?w)
                        (:endgroup . nil)
                        (:startgroup . depth)
                        ("shallow" . ?s) ("deep" . ?d)
                        (:endgroup . depth)))
  (setq org-cite-global-bibliography (list (expand-file-name "~/projects/org-roam/library.bib")))
  (customize-set-variable 'org-anki-default-deck "Default"))

(map! :after evil-org
      :map evil-org-mode-map
      :ni "C-<return>" #'org-insert-heading-respect-content)

;; Org roam options
(after! org-roam
  (setq org-roam-directory "~/projects/org-roam/cards"
        org-roam-capture-templates
        '(("d" "default" plain
           "%?"
           :target (file+head "${slug}.org" "#+TITLE: ${title}")
           :unnarrowed t))
        org-roam-completion-everywhere t)

  ;; org-roam-ui config
  (use-package! websocket)
  (use-package! org-roam-ui)
  (use-package! org-roam-timestamps
    :config (org-roam-timestamps-mode)))

(use-package! anki-editor
  :after org-mode
  :config
  (setq anki-editor-create-decks 't))

;; If you want to change the style of line numbers, change this to `relative' or
;; `nil' to disable it:
(setq display-line-numbers-type nil)

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

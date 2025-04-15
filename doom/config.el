;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "Monaspace Neon" :size 12 :weight 'semi-light)
  doom-variable-pitch-font (font-spec :family "Monaspace Neon" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(use-package! org-roam
  :init
  (setq org-roam-directory (file-truename "~/org/roam"))
  :config
  (org-roam-db-autosync-mode)
  (setq org-roam-dailies-directory "daily/")
    (setq org-roam-dailies-capture-templates
        '(("d" "default" entry
           "* %?"
           :if-new (file+head "%<%Y-%m-%d>.org"
                              "#+title: %<%A, %B %d, %Y>\n")
           :unnarrowed t))))

;; Helpers - ChatGPT Generated
(defvar my/org-roam-dailies-triple-view-open nil
  "Flag to track if the triple daily view is open.")

(defvar my/org-roam-dailies-triple-view--saved-config nil
  "Saved window configuration before opening the triple-pane daily view.")

(defun my/org-roam-dailies-triple-view-toggle ()
  "Toggle a 3-pane layout: yesterday, today, tomorrow's org-roam dailies."
  (interactive)
  (require 'org-roam-dailies)
  (if my/org-roam-dailies-triple-view-open
      ;; Restore previous layout
        (when my/org-roam-dailies-triple-view--saved-config
        (set-window-configuration my/org-roam-dailies-triple-view--saved-config)
        (setq my/org-roam-dailies-triple-view--saved-config nil)
        (setq my/org-roam-dailies-triple-view-open nil))
      (progn
        (setq my/org-roam-dailies-triple-view--saved-config (current-window-configuration))
        (delete-other-windows)

      ;; Center: today
      (org-roam-dailies-goto-today)

      ;; Left: yesterday
      (let ((left (split-window nil nil 'left)))
        (select-window left)
        (org-roam-dailies-goto-yesterday 1))

      ;; Return to center
      (other-window -1)

      ;; Right: tomorrow
      (let ((right (split-window nil nil 'right)))
        (select-window right)
        (org-roam-dailies-goto-tomorrow 1))

      ;; Return to center
      (other-window 1)

      ;; Make all three windows the same size
      (balance-windows)
      (setq my/org-roam-dailies-triple-view-open t))))


(defvar my/org-roam-note-side-buffer nil
  "Buffer for the temporary right-side note.")

(defun my/org-roam-note-side-toggle ()
  "Toggle a right-side window for an Org-roam note."
  (interactive)
  (if (and my/org-roam-note-side-buffer
           (get-buffer-window my/org-roam-note-side-buffer))
      (progn
        (delete-window (get-buffer-window my/org-roam-note-side-buffer))
        (setq my/org-roam-note-side-buffer nil))
    (let ((note (org-roam-node-read)))
      (setq my/org-roam-note-side-buffer (find-file-noselect (org-roam-node-file note)))
      (select-window (split-window-right))
      (switch-to-buffer my/org-roam-note-side-buffer)
      (other-window -1))))

;; KEYBINDS
(map! :leader
      :desc "Toggle triple daily view"
      "n r 3" #'my/org-roam-dailies-triple-view-toggle

      :desc "Toggle side note"
      "n r s" #'my/org-roam-note-side-toggle)

;; basic.el

;; backup files directory
(setq backup-directory-alist `(("." . "~/.emacs.d/auto-backups")))

;; disable auto save
(setq auto-save-default nil)

;; disable file lock
(setq create-lockfiles nil)

;; use space instead of tabs
(setq-default indent-tabs-mode nil)

;; show current column number
(column-number-mode 1)

;; aways show line number
(global-linum-mode 1)
(setq linum-format "%3d ")

;; set fill column to 80
(setq-default fill-column 80)

;; disable menu bar
(menu-bar-mode -99)

;; delete all trailing white space on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; show parenthese matched
(show-paren-mode 1)

;; enable auto parenthese and quotes
(electric-pair-mode 1)

;; load packages
(load "~/.emacs.d/packages.el")

;; themes
(load-theme 'monokai t)

;; set column marker to 80 in php mode
(add-hook 'php-mode-hook (lambda () (interactive) (column-marker-1 80)))

;; load packages
(load "~/.emacs.d/packages.el")

;; themes
(load-theme 'monokai t)

;; set column marker to 80 in php mode
(add-hook 'php-mode-hook (lambda () (interactive) (column-marker-1 80)))

;; use web-mode for *.blade.php
(add-to-list 'auto-mode-alist '("\\.blade\\.php\\'" . web-mode))

;; set indent width to 2 in web mode
(setq web-mode-markup-indent-offset 2)
;;(setq web-mode-css-indent-offset 2)
;;(setq web-mode-code-indent-offset 2)

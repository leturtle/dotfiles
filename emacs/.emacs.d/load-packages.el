;; setup ELPA package sources
(require 'cl)

;; load other packages
(load "~/.emacs.d/packages.el")

;; package and mode settings

;; themes
(load-theme 'monokai t)

;; overwrite ac-etags-setup, do not use faces
(eval-after-load "ac-etags"
  '(defun ac-etags-setup ()
     (interactive)
     (ac-define-source etags
                       `((candidates . ac-etags--candidates)
                         (requires . ,ac-etags-requires)))))

;; syntax check when buffer is open or saved
(setq flycheck-check-syntax-automatically '(mode-enabled save))

;; set column marker to 80 in php mode
(add-hook 'php-mode-hook
          '(lambda () (interactive)
             (column-marker-1 80)
             (flycheck-mode 1)
             (custom-set-variables '(ac-etags-requires 1))
             (ac-etags-setup)
             (ac-etags-ac-setup)
             ))


;; use web-mode for *.blade.php
(add-to-list 'auto-mode-alist '("\\.blade\\.php\\'" . web-mode))

;; set indent width to 2 in web mode
(add-hook 'web-mode-hook
          '(lambda()
             (setq web-mode-markup-indent-offset 2)
             ;; (setq web-mode-css-indent-offset 2)
             ;; (setq web-mode-code-indent-offset 2)
             (flycheck-mode 1)
             ))

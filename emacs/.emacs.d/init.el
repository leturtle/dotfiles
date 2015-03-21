(load "~/.emacs.d/load-packages.el")

(add-hook 'after-init-hook
          '(lambda ()
            (load "~/.emacs.d/basic.el")))

(add-hook 'after-init-hook
          '(lambda ()
             (load "~/.emacs.d/basic.el")
             (load "~/.emacs.d/load-packages.el")
             (load "~/.emacs.d/functions.el")))

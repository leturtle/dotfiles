;; add a function to set project directory for ctags file
(defun set-project-dir (dir-name)
  "Set project directory (for ctags file)."
  (interactive "DProject Directory: ")
  (set 'project-dir dir-name)
  (let ((tags-file (concat dir-name "TAGS")))
    (if (not (file-exists-p tags-file))
        (create-tags))
    (visit-tags-table tags-file)))

;; add a function to create ctags
(defun create-tags ()
  "Create tags for project."
  (interactive)
  (if (boundp 'project-dir)
      (shell-command
       (format "ctags -f %s -e -R %s" (concat project-dir "TAGS") project-dir))
    (message "project-dir is not defined, try M-x [RET] set-project-dir [RET] to set")))

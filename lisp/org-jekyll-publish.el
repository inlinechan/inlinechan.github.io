;;; Package --- Summary

;;; Commentary:

;; To use this
;; $ cd ~/.emacs.d/lisp # or any directory in 'load-path
;; $ ln -s /path/to/org-jekyll-publish.el .

;;; Code:

(defcustom org-jekyll-publish-base-dir "~/Documents/org-jekyll/"
  "Base directory name of jekyll tree."
  :type 'string
  :group 'org-jekyll-publish)

(defvar org-jekyll-publish-org-dir (expand-file-name (concat org-jekyll-publish-base-dir "org")))
(defvar org-jekyll-publish-posts-dir (expand-file-name (concat org-jekyll-publish-base-dir "_posts")))

(defvar org-jekyll-publish-alist
  `(("org-inlinechan"
     ;; Path to your org files.
     :base-directory ,org-jekyll-publish-org-dir
     :base-extension "org"
     ;; Path to your Jekyll project.
     :publishing-directory ,org-jekyll-publish-posts-dir
     :recursive t
     :publishing-function org-html-publish-to-html
     :headline-levels 4
     :html-extension "html"
     :with-toc nil
     :body-only t ;; Only export section between <body> </body>
     )

    ("org-static-inlinechan"
     :base-directory ,org-jekyll-publish-org-dir
     :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|php"
     :publishing-directory ,org-jekyll-publish-posts-dir
     :recursive t
     :publishing-function org-publish-attachment)

    ("inlinechan" :components ("org-inlinechan" "org-static-inlinechan"))
    ))

(if (listp 'org-publish-project-alist)
    (add-to-list org-jekyll-publish-alist)
  (setq org-publish-project-alist org-jekyll-publish-alist))

(provide 'org-jekyll-publish)

;;; org-jekyll-publish.el ends here

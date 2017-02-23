;;; packages.el --- tufte-latex layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Daniël de Kok <me@danieldk.eu>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(setq tufte-latex-packages
      '(
        org
        (ox-tufte-latex :location (recipe
                                   :fetcher github
                                   :repo tsdye/tufte-org-mode)
                        )
        ))

(defun tufte-latex/init-ox-tufte-latex ()
  (use-package ox-tufte-latex)
  )

(defun tufte-latex/post-init-org ()
  (with-eval-after-load 'org
    (add-to-list 'org-latex-classes
                 '("tufte-handout"
                   "\\documentclass{tufte-handout}"
                   ("\\section{%s}" . "\\section*{%s}")
                   ("\\subsection{%s}" . "\\subsection*{%s}")
                   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                   ("\\paragraph{%s}" . "\\paragraph*{%s}")
                   ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))))

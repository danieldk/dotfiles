
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

(require 'use-package)

(require 'evil)
(evil-mode 1)

(use-package which-key
  :init (which-key-mode)

  :config
  (which-key-setup-side-window-right-bottom)
  (setq which-key-sort-order 'which-key-key-order-alpha
        which-key-side-window-max-width 0.33
        which-key-idle-delay 0.05)
)

(use-package general
  :config
  (general-evil-setup t)

  (general-define-key
   :states '(normal motion emacs)
   :prefix "SPC"
   "b"  '(:ignore t :which-key "Buffer")
   "bb" '(ivy-switch-buffer "Switch buffer")
   "bd" '(kill-this-buffer "Kill buffer")

   "f"  '(:ignore t :which-key "File")
   "fs" '(save-buffer)
   "fr" '(ivy-recentf "Recent file")

   "wv" '(split-window-horizontally :which-key "split vertical")
   "ws" '(split-window-vertically :which-key "split horizontal")
   "wk" '(windmove-up :which-key "up")
   "wj" '(windmove-down :which-key "down")
   "wl" '(windmove-left :which-key "left")
   "wr" '(windmove-right :which-key "right")
   "wd" '(delete-window :which-key "delete")
   )
)

(use-package eye-browse
  :init
  (eyebrowse-mode t)
  :config
  (eyebrowse-setup-opinionated-keys)
)

(use-package org
  :general
  (:states '(normal motion emacs)
   :keymaps 'org-mode-map
   :prefix "SPC"
   "m"  '(:ignore t :which-key "Mode")
   "ma" '(org-agenda :which-key "Agenda")
   "mA" '(org-archive-subtree :which-key "Archive")
   "md" '(org-deadline :which-key "Deadline")
   "mP" '(org-set-property :which-key "Property")
   "m:" '(org-set-tags :which-key "Tags")

   ;; tables
   "mtdc" '(org-table-delete-column)
   "mtdr" '(org-table-kill-row)
   "mte" '(org-table-eval-formula)
   "mtE" '(org-table-export)
   "mth" '(org-table-previous-field)
   "mtH" '(org-table-move-column-left)
   "mtic" '(org-table-insert-column)
   "mtih" '(org-table-insert-hline)
   "mtiH" '(org-table-hline-and-move)
   "mtir" '(org-table-insert-row)
   "mtI" '(org-table-import)
   "mtj" '(org-table-next-row)
   "mtJ" '(org-table-move-row-down)
   "mtK" '(org-table-move-row-up)
   "mtl" '(org-table-next-field)
   "mtL" '(org-table-move-column-right)
   "mtn" '(org-table-create)
   "mtN" '(org-table-create-with-table.el)
   "mtr" '(org-table-recalculate)
   "mts" '(org-table-sort-lines)
   "mttf" '(org-table-toggle-formula-debugger)
   "mtto" '(org-table-toggle-coordinate-overlays)
   "mtw" '(org-table-wrap-region))

  (:states '(normal motion emacs)
   :prefix "SPC"

   ;; Global agenda mappings
   "ao#" '(org-agenda-list-stuck-projects)
   "ao/" '(org-occur-in-agenda-files)
   "aoa" '(org-agenda-list)
   "aoe" '(org-store-agenda-views)
   "aom" '(org-tags-view)
   "aoo" '(org-agenda)
   "aos" '(org-search-view)
   "aot" '(org-todo-list)

   ;; other
   "aoO" '(org-clock-out)
   "aoc" '(org-capture)
   "aol" '(org-store-link))

  (general-define-key
   :keymaps 'org-agenda-mode-map
   "h" 'evil-backward-char
   "l" 'evil-forward-char
   "j" 'evil-next-line
   "k" 'evil-previous-line)

  :config
  (setq org-agenda-files '("~/git/org/"))

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((gnuplot . t)
     (python . t)
     (latex . t))))

 (use-package org-ref
    :init
    ;;:mode "\\.org\\'"
    :after org
    :general
    (:states '(normal motion emacs)
     :prefix "SPC"
     :keymaps 'bibtex-mode-map
     "mh" '(org-ref-bibtex-hydra/body :which-key "BibTeX hydra")
    )
    :config
    (setq
     org-ref-default-bibliography '("~/git/papers/references.bib")
     org-ref-pdf-directory "~/git/papers/"
     org-ref-bibliography-notes "~/git/org/literature.org")
    )


;;(use-package ivy-bibtex
;;  :config
;;  (setq bibtex-completion-bibliography '("~/git/papers/references.bib")))

(use-package evil-org
  :after org
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
            (lambda ()
              (evil-org-set-key-theme '(todo)))))

(use-package org-bullets
  :after org
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  (setq org-bullets-bullet-list '("①" "②" "③ " "④" "⑤" "⑥" "⑦" "⑧" "⑨" "⑩" "⑪" "⑫" "⑬" "⑭" "⑮")))

(use-package ivy
  :diminish (ivy-mode . "")
  :init (ivy-mode 1)
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-hight 20)
  (setq ivy-count-format "(%d/%d) ")
)

(use-package counsel :ensure t
  :bind*                           ; load counsel when pressed
  (("M-x"     . counsel-M-x)       ; M-x use counsel
   ("C-x C-f" . counsel-find-file) ; C-x C-f use counsel-find-file
   ("C-x C-r" . counsel-recentf)   ; search recently edited files
   ("C-c f"   . counsel-git)       ; search for files in git repo
   ("C-c s"   . counsel-git-grep)  ; search for regexp in git repo
   ("C-c /"   . counsel-ag)        ; search for regexp in git repo using ag
   ("C-c l"   . counsel-locate))   ; search for files or else using locate
)

(use-package projectile
  :general
  (:states '(normal motion emacs)
   :prefix "SPC"
   "p"  '(:ignore t :which-key "Project")  
   "pf" '(projectile-find-file :which-key "Find in project")
   "pl" '(projectile-switch-project :which-key "Switch project"))

  :init (projectile-mode 1)
   
  :config
  (progn
    (setq projectile-enable-caching t)
    (setq projectile-require-project-root nil)
    (setq projectile-completion-system 'ivy)
    (add-to-list 'projectile-globally-ignored-files ".DS_Store")))

(use-package magit
  :general
  (:states '(normal motion emacs)
   :prefix "SPC"
   "g"  '(:ignore t :which-key "Git")  
   "gs" 'magit-status)

  :config
  (use-package evil-magit))



(dolist (mode
	 '(tool-bar-mode
	   tooltip-mode
	   scroll-bar-mode
	   menu-bar-mode
	   blink-cursor-mode))
  (funcall mode 0))

(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
)

(when (window-system)
   (set-default-font "Operator Mono 15"))

(setq reftex-default-bibliography '("~/git/papers/references.bib")
      org-latex-create-formula-image-program 'imagemagick
      org-latex-table-scientific-notation "$%s\\times10^{%s}$"
     ) 
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

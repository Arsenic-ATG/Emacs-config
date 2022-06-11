;; Move customization variables to a separate file and load it
(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)

;; Revert Dired and other buffers
(setq global-auto-revert-non-file-buffers t)

;; Switching windows using M-o
(global-set-key (kbd "M-o") 'other-window)

;; keep all the mess at one place
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
  )

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(windmove-default-keybindings)

(defvar arsenic/default-font-size 150)

;; Clean UI
(setq inhibit-startup-message t)

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room

;;;;;;;;;;;;;;;;;;;;;;;;
;; Font Configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;

(set-face-attribute 'default nil :font "Fira Code" :height arsenic/default-font-size)

;; Set the fixed pitch face
(set-face-attribute 'fixed-pitch nil :font "Fira Code" :height 150)

;; Set the variable pitch face
(set-face-attribute 'variable-pitch nil :font "Cantarell" :height 152 :weight 'regular)

(use-package doom-themes
    :init (load-theme 'doom-horizon t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package Manager Config ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)

;; Initialize package resources
(setq package-archives
      '(("GNU" . "http://elpa.gnu.org/packages/")
        ("MELPA" . "http://melpa.org/packages/")
        ("nonGNU" . "https://elpa.nongnu.org/nongnu/")
	("MELPA Stable" . "http://stable.melpa.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialise use package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package swiper :ensure t)

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

;; all the icons required for doom-modeline to work properly
(use-package all-the-icons)

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 10)))

(column-number-mode)
(global-display-line-numbers-mode t)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))

(use-package all-the-icons-ivy-rich
  :after counsel-projectile
  :init (all-the-icons-ivy-rich-mode +1))

(use-package ivy-rich
  :ensure t
  :after (counsel)
  :config (ivy-rich-mode 1))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
         ("C-x b" . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history)))

(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  ;; NOTE: Set this to the folder where you keep your Git repos!
  (when (file-directory-p "~/Projects/Code")
    (setq projectile-project-search-path '("~/Projects/Code")))
  (setq projectile-switch-project-action #'projectile-dired))

(use-package counsel-projectile
  :config (counsel-projectile-mode))

;; highlights uncommitted changes on the left side of the window
(use-package diff-hl
  :init
        (global-diff-hl-mode)  ;; enable it globally
        (diff-hl-margin-mode)  ;; display changes in margin instead of gutter
        (diff-hl-flydiff-mode) ;; show hl on the fly
)

(use-package magit
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))


;; discord rpc for emacs
(use-package elcord
  :init (elcord-mode))

;;;;;;;;;;;;;;;;
;; Navigation ;;
;;;;;;;;;;;;;;;;

;; fast forward direct cursor movement (like ace jump mode)
(use-package avy
  :bind ("M-s" . avy-goto-char-timer))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org Mode Configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun efs/org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 1)
  (visual-line-mode 1))

(defun efs/org-font-setup ()
  ;; Replace list hyphen with dot
  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

  ;; Set faces for heading levels
  (dolist (face '((org-level-1 . 1.2)
                  (org-level-2 . 1.1)
                  (org-level-3 . 1.05)
                  (org-level-4 . 1.0)
                  (org-level-5 . 1.1)
                  (org-level-6 . 1.1)
                  (org-level-7 . 1.1)
                  (org-level-8 . 1.1)))
    (set-face-attribute (car face) nil :font "Cantarell" :weight 'regular :height (cdr face)))

  ;; Ensure that anything that should be fixed-pitch in Org files appears that way
  (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-table nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch))

(use-package org
  :hook (org-mode . efs/org-mode-setup)
  :config
  (setq org-ellipsis " ▾")

  (setq org-agenda-start-with-log-mode t)
  (setq org-log-done 'time)
  (setq org-log-into-drawer t)

  ;; Save Org buffers after refiling!
  (advice-add 'org-refile :after 'org-save-all-org-buffers))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(defun efs/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . efs/org-mode-visual-fill))

;; This is needed as of Org 9.2
(require 'org-tempo)

(add-to-list 'org-structure-template-alist '("sh" . "src shell"))
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
(add-to-list 'org-structure-template-alist '("py" . "src python"))
(add-to-list 'org-structure-template-alist '("cpp" . "src cpp"))

;; dired config

(use-package dired
  :ensure nil
  :commands (dired dired-jump)
  :custom ((insert-directory-program "gls" dired-use-ls-dired t)
           (dired-listing-switches "-agho --group-directories-first"))
  :bind (("C-x C-j" . dired-jump)))

(use-package dired-single)

(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode)
  :init (setq all-the-icons-dired-monochrome nil))


(use-package multiple-cursors
  :bind ( ("C-S-c C-S-c" . mc/edit-lines)
          ( "C->" . mc/mark-next-like-this)
          ("C-<" . mc/mark-previous-like-this)
          ("C-c C-<". mc/mark-all-like-this)))

;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Programming specific ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq apropos-sort-by-scores t)

;; follow gnu coding convention by defult
(setq c-default-style "gnu")

;;activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)

;; show unncessary whitespace ( it's more of a distraction for me rn)
;;(add-hook 'prog-mode-hook (lambda () (interactive) (setq show-trailing-whitespace 1)))

;; use space to indent by default
(setq-default indent-tabs-mode nil)

;; set appearance of a tab that is represented by 8 spaces
(setq-default tab-width 8)

;; dtrt-indent: to detect and set indend offset depending on the file being edited
(require 'dtrt-indent)
(dtrt-indent-mode 1)

;; Highlight and replace multiple occurances of a text in the buffer
(use-package iedit)

;; syntax checking on the fly
(use-package flycheck
  :init (global-flycheck-mode)
  :config
  (add-hook 'c++-mode-hook
          (lambda () (setq flycheck-clang-language-standard "c++2a"))))

(use-package markdown-mode
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Aindent and we-butler to clean up useless whitespaces in source ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; clean auto-indent and backspace unindent
(use-package clean-aindent-mode
  :hook (prog-mode . clean-aindent-mode))

;; strip additional whitespaces at the end of lines
(use-package ws-butler
  :hook (prog-mode . ws-butler-mode))

;; add closing parenthesis with opening ones
(require 'smartparens-config)
(show-smartparens-global-mode +1)
(smartparens-global-mode 1)

;; on RET press, the curly braces automatically add another newline
(sp-with-modes '(c-mode c++-mode)
  (sp-local-pair "{" nil :post-handlers '(("||\n[i]" "RET")))
  (sp-local-pair "/*" "*/" :post-handlers '((" | " "SPC")
                                            ("* ||\n[i]" "RET"))))

;; ggtags (gnu global tags)
(require 'ggtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
              (ggtags-mode 1))))

(define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
(define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
(define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
(define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
(define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
(define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)

(define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)

;;integrating ggtags with imenue
(setq-local imenu-create-index-function #'ggtags-build-imenu-index)

;;;;;;;;;;;;;;;;;;;;;;;;
;; Code auto complete ;;
;;;;;;;;;;;;;;;;;;;;;;;;

;; auto complete
(require 'cc-mode)

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
;;(setq company-backends (delete 'company-semantic company-backends))

;; company-c-headers ( auto complete c header names )
(require 'company-c-headers)
(add-to-list 'company-backends 'company-c-headers)
;; let company c headers also complete c++ headers
(add-to-list 'company-c-headers-path-system "/usr/local/Cellar/gcc/11.2.0/include/c++/11.2.0")


;; code snippets ( for more autocomplete )
(use-package yasnippet
  :init (yas-global-mode 1))

;; tab to indent and autocomplete
(setq tab-always-indent 'complete)

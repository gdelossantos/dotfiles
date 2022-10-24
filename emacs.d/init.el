;; Global dkey settings
(global-set-key "\r" 'newline-and-indent)

;;; Global set emacs to revert unmodified buffers
(global-auto-revert-mode t)

;; highlight the current line same as eclipse
(global-hl-line-mode)

;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
;; (when
;; 	(load
;; 	 (expand-file-name "~/.emacs.d/elpa/package.el"))
;;   (package-initialize))

;; Setup marmalade. This rides on the 'elpa' packages so those ones have
;; to be deployed first.
(when (>= emacs-major-version 24)
  (require 'package)

;;; setting packages

  ;; temporarily disabling the https connection due to an issue with Emacs 24
  ;; (add-to-list 'package-archives
  ;; 			   '("marmalade" . "https://marmalade-repo.org/packages/")
  ;; 			   t)
  ;; (add-to-list 'package-archives
  ;; 			   '("marmalade" . "http://marmalade-repo.org/packages/")
  ;; 			   t)
  
										; (add-to-list 'package-archives
										; '("melpa" . "http://melpa.milkbox.net/packages/"))
  ;; (add-to-list 'package-archives
  ;; 			   '("melpa-stable" . "https://stable.melpa.org/packages/") t)
  (add-to-list 'package-archives
			   '("melpa" . "https://melpa.org/packages/") t)
  (add-to-list 'package-archives
			   '("org" . "https://orgmode.org/elpa/") t)
  (add-to-list 'package-archives
			   '("gnu" . "http://elpa.gnu.org/packages/") t)

;;; This is *very* important, it loads all the elpa packages into the load-path
;;; For Aquamacs, the elpa packages are on "~/Library/Preferences/Aquamacs Emacs"
  (package-initialize))

;;; Emacs 26.2 has a problem with TLS1.3
;;; Need to add the following lines in order to connect to elpa.gnu.org:443 properly
;;; 2019-09-24 update: moved to 26.3 so this is not needed anymore
;(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; This is for gnuserv stuff on xemacs
;(when (featurep 'xemacs)
;  (require 'gnuserv)
;  (gnuserv-start)
;  (setq gnuserv-frame (selected-frame)))

(add-to-list 'load-path "~/.emacs-lisp")

;; disable text wrapping
(set-variable 'truncate-lines 't)

;;; 2020-08-15: Turning off planner. I don't recall using it. Must
;;; have been a long while.
;;; ----------------------------------------------------------------------
;; set the planner folder
;; (setq muse-project-alist 
;;       '(("WikiPlanner"
;; 		 ("/Users/bartd/notebook/plans"
;; 		  :default "index"
;; 		  :major-mode planner-mode
;; 		  :visit-link planner-visit-link))))
;; (require 'planner)

;;(set-face-background 'default "white")
;; Activate the mousewheel
;;(mwheel-install)

;;; 2020-10-21: Adjusted the mouse wheel to be smoother
;;; The default is jumpy
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ; one line at a time
(setq mouse-wheel-progressive-speed nil) ; don't accelerate

;; Find file at point
;;(require 'ffap)
;;(ffap-bindings)

;; Set the function mode
;; (which-function-mode t)

;;----------------------------------------------------------------------
;; Set my own keys
;;----------------------------------------------------------------------
;;; 2015-07-18: decided to turn 
;; (global-set-key [f2] 'save-buffer)		;; save
;; (global-set-key [f3] 'find-file-at-point)	;; load
;; (global-set-key [f9] 'compile)			;; compile
;; (global-set-key [f7] 'compile)

;;; 2021-07-17 (Sat) enable evil mode in the system
(global-set-key [f12] 'evil-mode)

;; Set the Control-Tab sequence to other-window
(global-set-key [C-tab] 'other-window)

;; 2020-12-01: Need to remap the home and end keys
;; I got the Tempest Kirin v2 Tenkeyless keyboard with a home and end keys
;; The built-in mac keyboard don't have these keys so they were not a problem
(global-set-key (kbd "<home>") 'beginning-of-line)
(global-set-key (kbd "<end>") 'end-of-line)



;; Change the switch buffer key
;;(global-set-key [C-rwindow] 'switch-to-buffer)

;;
;; This removes unsightly ^M characters that would otherwise
;; appear in the output of java applications.
;;
(add-hook 'comint-output-filter-functions
	  'comint-strip-ctrl-m)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-hscroll-mode t)
 '(c-basic-offset 4)
 '(c-tab-always-indent nil)
 '(cider-lein-command "/usr/local/bin/lein")
 '(column-number-mode t)
 '(custom-safe-themes
   '("1c082c9b84449e54af757bcae23617d11f563fc9f33a832a8a2813c4d7dfb652" "d2e9c7e31e574bf38f4b0fb927aaff20c1e5f92f72001102758005e53d77b8c9" default))
 '(gnuserv-program (concat exec-directory "/gnuserv"))
 '(load-home-init-file t t)
 '(org-agenda-files
   '("~/Projects/LTA/prod_issues/prod_issue_notes.org" "/Users/bartd/Projects/LTA/bs_work/bs38/01_plan/bs38_notes.org" "/Users/bartd/Documents/04_lta/002_timesheet/LTA timesheet 2021.txt" "/Users/bartd/Projects/LTA/bs_work/bs37/01_plan/bs37_notes.org" "/Users/bartd/Projects/LTA/bs_work/bs36/01_plan/bs36_notes.org" "/Users/bartd/Projects/LTA/bs_work/bs35/01_plan/bs35_notes.org" "/Users/bartd/Documents/05_personal_files/bart_gcal.org" "/Users/bartd/Projects/LTA/abt/01_plan/abt_notes.org" "/Users/bartd/Projects/LTA/bos/plan/bos_plan.txt"))
 '(org-clock-into-drawer "CLOCKING")
 '(org-enforce-todo-dependencies t)
 '(org-fontify-done-headline t)
 '(org-hide-emphasis-markers nil)
 '(org-log-done 'time)
 '(org-log-into-drawer t)
 '(org-refile-allow-creating-parent-nodes 'confirm)
 '(org-refile-use-outline-path 'file)
 '(org-track-ordered-property-with-tag t)
 '(package-selected-packages
   '(helm-c-yasnippet helm helm-core flycheck lsp-ui lsp-mode rustic rust-mode evil org-superstar exec-path-from-shell all-the-icons-dired which-key eterm-256color ewal-doom-themes doom-themes doom-modeline all-the-icons treemacs smartscan validate yasnippet-snippets citeproc-org org sokoban ivy minimap json-mode org-magit helm-projectile projectile swiper-helm org-bullets org-plus-contrib powerline clojure-mode yaml-mode use-package rainbow-delimiters paredit markdown-mode magit less-css-mode javascript java-snippets helm-swoop groovy-mode coffee-mode clojure-snippets cider))
 '(parens-require-spaces nil)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(tooltip-mode nil)
 '(truncate-lines t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#002b36" :foreground "#839496" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "nil" :family "Jetbrains Mono"))))
 '(org-done ((t (:foreground "PaleGreen" :weight normal :strike-through t))))
 '(org-headline-done ((((class color) (min-colors 16) (background dark)) (:foreground "LightSalmon" :strike-through t))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "dark orange"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "deep pink"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "chartreuse"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "deep sky blue"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "yellow"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "orchid"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "spring green"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "sienna1")))))

(put 'downcase-region 'disabled nil)

;; python bindings
;(autoload 'python-mode "python-mode" "Python editing mode." t)
;(setq auto-mode-alist
;      (cons '("\\.py$" . python-mode) auto-mode-alist))
;(setq interpreter-mode-alist
;      (cons '("python" . python-mode)
;            interpreter-mode-alist))

;; Line numbers are not on by default in XEmacs
;(setq-default line-number-mode 't)

;; Disable creation of backup files
(setq make-backup-files nil)

;;; Commands added by calc-private-autoloads on Wed Jun 13 09:56:44 2001.
;(autoload 'calc-dispatch	   "calc" "Calculator Options" t)
;(autoload 'full-calc		   "calc" "Full-screen Calculator" t)
;(autoload 'full-calc-keypad	   "calc" "Full-screen X Calculator" t)
;(autoload 'calc-eval		   "calc" "Use Calculator from Lisp")
;(autoload 'defmath		   "calc" nil t t)
;(autoload 'calc			   "calc" "Calculator Mode" t)
;(autoload 'quick-calc		   "calc" "Quick Calculator" t)
;(autoload 'calc-keypad		   "calc" "X windows Calculator" t)
;(autoload 'calc-embedded	   "calc" "Use Calc inside any buffer" t)
;(autoload 'calc-embedded-activate  "calc" "Activate =>'s in buffer" t)
;(autoload 'calc-grab-region	   "calc" "Grab region of Calc data" t)
;(autoload 'calc-grab-rectangle	   "calc" "Grab rectangle of data" t)
;(setq load-path (nconc load-path (list "d:/Expanded/calc-2.02f")))
;(global-set-key "\e#" 'calc-dispatch)
;;; End of Calc autoloads.

;;----------------------------------------------------------------------
;; Bart specific variables
;;----------------------------------------------------------------------

;; Add auto-fill to all org mode files
(add-hook 'org-mode-hook 'turn-on-auto-fill)


;; Add long lines support for all text modes
;; Enable this if you want soft newlines to your text modes.
;; I prefer hard newlines.
;;;(add-hook 'text-mode-hook 'longlines-mode)

;;; 2018-03-12
;;; Enable fast Ctrl-N srolling
(setq auto-window-vscroll nil)

;;----------------------------------------------------------------------
;; Bart specific defuns
;;----------------------------------------------------------------------

(defun string/starts-with (s begins)
  "Return non-nil if string S starts with BEGINS (case insensitive)"
  (let ((begins-down (downcase begins))
		(begins-len (length begins))
		(s-down (downcase s))
		(s-len (length s)))
	(cond ((>= s-len begins-len)
		   (string-equal (substring s-down 0 begins-len) begins-down))
		  (t nil))))

;;; This is used by bart-unix-time
;;; This simply removes the surrounding parenthesis
(defun convert-list-to-string (list)
  "Convert LIST to string."
  (let* ((string-with-parenthesis (format "%S" list))
		 (end (- (length string-with-parenthesis) 1)))
    (substring string-with-parenthesis 1 end)))

;; Utility method to convert unix time to something human readable
;; decode-time returns a list so have to use convert-list-to-string to be able to insert it in the buffer
(defun bart-unix-time (seconds)
  (forward-line)
  ;(insert (convert-list-to-string (decode-time (seconds-to-time seconds))))
  (insert (format "%S" (decode-time (seconds-to-time seconds))))
  (newline))

;;; The following lines is only valid in Hinata
(when (string/starts-with system-name "Hinata")
  ;; Load the timesheet file
  (defun bart-ts()
	(interactive)
	(find-file "/Users/bartd/Documents/04_lta/002_timesheet/LTA timesheet 2022.txt"))

  ;; Insert the current time to the buffer (24h format)
  (defun bart-cur-time()
	(interactive)
	(insert
	 (format-time-string "%H:%M" (current-time))))

  (defun bart-init()
	(interactive)
	(find-file "~/.emacs.d/init.el"))

  ;; Load the RS111 file
  (defun bart-rs111 ()
	(interactive)
	(find-file "~/Projects/LTA/rs111/rs111_notes.org"))

  ;; Load the prod issues list
  (defun bart-prod-issues ()
	(interactive)
	(find-file "~/Projects/LTA/prod_issues/prod_issue_notes.org"))
  
  ;; Load the bs26 todo file
  (defun bart-todo ()
	(interactive)
	(find-file "~/Projects/LTA/bos/plan/bos_plan.txt"))
  
  (defun bart-bs36 ()
	(interactive)
	(find-file "~/Projects/LTA/bs_work/bs36/01_plan/bs36_notes.org"))

  (defun bart-bs37 ()
	(interactive)
	(find-file "~/Projects/LTA/bs_work/bs37/01_plan/bs37_notes.org"))

  (defun bart-bs38 ()
	(interactive)
	(find-file "~/Projects/LTA/bs_work/bs38/01_plan/bs38_notes.org"))

  (defun bart-bs39 ()
	(interactive)
	(find-file "~/Projects/LTA/bs_work/bs39/01_plan/bs39_notes.org"))

  (defun bart-bs40 ()
	(interactive)
	(find-file "~/Projects/LTA/bs_work/bs40/01_plan/bs40_notes.org"))

  (defun bart-bs41 ()
	(interactive)
	(find-file "~/Projects/LTA/bs_work/bs41/01_plan/bs41_notes.org"))

  (defun bart-bs42 ()
	(interactive)
	(find-file "~/Projects/LTA/bs_work/bs42/01_plan/bs42_notes.org"))

  (defun bart-abt ()
	(interactive)
	(find-file "~/Projects/LTA/abt/01_plan/abt_notes.org"))

  (defun intern-isaac ()
	(interactive)
	(find-file "~/Projects/LTA/50_intern/2022_isaac/isaac_notes.org"))

  (defun intern-sng-wei-li ()
	(interactive)
	(find-file "~/Projects/LTA/50_intern/2022_sng_wei_li/sng_wei_li_notes.org"))
  
  (defun intern-cheong-li-yuan ()
	(interactive)
	(find-file "~/Projects/LTA/50_intern/2022_cheong_li_yuan/cheong_li_yuan_notes.org")))

;;; 2018-04-10
;;; The following lines is only valid in the office DN machine
(when
	(or (string/starts-with system-name "LAN-FS-NB-004")
		(string/starts-with system-name "LAN-ABT-NB-003"))
  ;; Disable the annoying "ding" when using the KVM
  ;; The KVM using the <scroll> key to switch machines
  (global-set-key [scroll] 'ignore)
  (defun bart-init ()
	(interactive)
	(find-file "C:/Users/santogm/AppData/Roaming/.emacs")))

;; Load the PHP editing major mode.
;(require 'php-mode)

;; Load the Scala editing major mode.
;(require 'scala-mode-auto)

;; clojure-mode
(require 'clojure-mode)

;; paredit-mode
(require 'paredit)
(add-hook 'clojure-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'emacs-lisp-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'lisp-mode-hook (lambda () (paredit-mode +1)))

;; rainbow delimiters
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)

;; load all lisp code under the .emacs-lisp folder
(defun add-subdirs-to-load-path (dir)
    (let ((default-directory (concat dir "/")))
	      (normal-top-level-add-subdirs-to-load-path)))

(add-subdirs-to-load-path "~/.emacs-lisp")

;; InteractivelyDoThings
;; - very useful for C-x b and C-x f
;(require 'ido)
;(ido-mode -1)
;(setq ido-enable-flex-matching t) ; enable fuzzy matching

;; Set Terminal.app encoding (designed for Mac)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)


;; 2021-07-05: disabled in favor of doom themes
;; ----------------------------------------------------------------------
;; Enable solarized color scheme
;; ----------------------------------------------------------------------
;; (require 'color-theme)
;; (eval-after-load "color-theme"
;;   '(progn
;; 	 (color-theme-initialize)
;; 	 (color-theme-solarized-dark)))

;;; Code to assist in clojure development
(defun helm-clojure-headlines ()
  "Display headlines for the current Clojure file."
  (interactive)
  (helm-mode t)
  (helm :sources '(((name . "Clojure Headlines")
                    (volatile)
                    (headline "^[;(]")))))

;;; 2015-07-12
;;; Shamelessly copied from Sacha Chua's emacs init file
;;; Presently, I don't know quite a bit of the configuration
(require 'use-package)
(use-package helm
  :ensure t
  :diminish helm-mode
  :init
  (progn
    (require 'helm-config)
    (setq helm-candidate-number-limit 100)
    ;; From https://gist.github.com/antifuchs/9238468
    (setq helm-idle-delay 0.0 ; update fast sources immediately (doesn't).
          helm-input-idle-delay 0.01  ; this actually updates things
                                        ; reeeelatively quickly.
          helm-yas-display-key-on-candidate t
          helm-quick-update t
          helm-M-x-requires-pattern nil
          helm-ff-skip-boring-files t)
    (helm-mode))
  :bind (("C-c h" . helm-mini)
         ("C-h a" . helm-apropos)
         ("C-x C-b" . helm-buffers-list)
         ("C-x b" . helm-buffers-list)
         ("M-y" . helm-show-kill-ring)
         ("M-x" . helm-M-x)
		 ;; 2016-12-14
		 ;; Bart: I prefer helm than the default. This binding has disappeared
		 ;; since I upgraded helm to a new version 
		 ("C-x C-f" . helm-find-files)
         ("C-x c o" . helm-occur)
         ("C-x c s" . helm-swoop)
         ("C-x c y" . helm-yas-complete)
         ("C-x c Y" . helm-yas-create-snippet-on-region)
         ;; ("C-x c b" . my/helm-do-grep-book-notes)
         ("C-x c SPC" . helm-all-mark-rings)))

;;; Note: Do not install helm-core, it causes haywire when loading helm
(put 'upcase-region 'disabled nil)

;;; 2018-03-10

;; Tranparency
;;; This is if you want some transparency in your frames
;;; I'm not really a fan of transparency
;;; (set-frame-parameter (selected-frame) 'alpha '(92 . 90))

;;; Make the alpha transparency a default
;;; (add-to-list 'default-frame-alist '(alpha . (92 . 90)))


;;; Beautifying the mode line
;;; ----------------------------------------------------------------------
;;; 2021-07-5: disabled in favor of doom modeline
;;; ----------------------------------------------------------------------
;;(require 'powerline)
;;(powerline-default-theme)

;;;----------------------------------------------------------------------
;;; Org specific configuration section
;;;----------------------------------------------------------------------

;;; 2018-03-13
;;; Beautifying the org bullets
;;; ----------------------------------------------------------------------
;;; 2021-07-11
;;; Disaled org-bullets in favor of org-superstar-mode
;;; ----------------------------------------------------------------------
;;(require 'org-bullets)
;;(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;;; 2019-11-13
;;; Hide the org emphasis markup
;; (setq org-hide-emphasis-markers t) ; already on custom set variables
;; (setq org-fontify-done-headline t) ; already on custom set variables

;;; 2018-03-18
;;; Add the org agenda key bindings
;;; Funny thing is that this was not added by default
(global-set-key "\C-ca" 'org-agenda)

;;; 2018-03-15

;;; Enhancing the emacs search with swiper
;;; I'm already using helm so decided to use swiper-helm instead of
;;; the base swiper implementation
(use-package swiper-helm
  :ensure t
  :bind (("C-s" . swiper-helm)
		 ("C-r" . swiper-helm)))

;;; Enable project based operations integrated with Helm
;; (require 'helm-projectile)
;; (helm-projectile-on)

;;; 2018-03-16

;;; Setup of treemacs
(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
	;; Don't want to use eVIl on emacs
    ;; (use-package treemacs-evil
    ;;   :ensure t
    ;;   :demand t)
    (setq treemacs-change-root-without-asking nil
          treemacs-collapse-dirs              (if (executable-find "python") 3 0)
          treemacs-file-event-delay           5000
          treemacs-follow-after-init          t
          treemacs-follow-recenter-distance   0.1
          treemacs-goto-tag-strategy          'refetch-index
          treemacs-indentation                2
          treemacs-indentation-string         " "
          treemacs-is-never-other-window      nil
          treemacs-never-persist              nil
          treemacs-no-png-images              nil
          treemacs-recenter-after-file-follow nil
          treemacs-recenter-after-tag-follow  nil
          treemacs-show-hidden-files          t
          treemacs-silent-filewatch           nil
          treemacs-silent-refresh             nil
          treemacs-sorting                    'alphabetic-desc
          treemacs-tag-follow-cleanup         t
          treemacs-tag-follow-delay           1.5
          treemacs-width                      35)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null (executable-find "python3"))))
      (`(t . t)
       (treemacs-git-mode 'extended))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind (([f8]         . treemacs)
		 ("M-0"        . treemacs-select-window)
		 ("C-c 1"      . treemacs-delete-other-windows)
		 ;; ("M-m ft"     . treemacs-toggle)
		 ;; ("M-m fT"     . treemacs)
		 ;; ("M-m fB"     . treemacs-bookmark)
		 ;; ("M-m f C-t"  . treemacs-find-file)
		 ;; ("M-m f M-t"  . treemacs-find-tag)
		 ))

;; (use-package treemacs-projectile
;;   :defer t
;;   :ensure t
;;   :config
;;   (setq treemacs-header-function #'treemacs-projectile-create-header)
;;   ;; Note: M-m binding is causing errors
;;   ;; :bind (:map global-map
;;   ;;             ("M-m fP" . treemacs-projectile)
;;   ;;             ("M-m fp" . treemacs-projectile-toggle))
;;   )


;;; 2019-05-15
;;; Added company-mode as a recommendation for CIDER auto-completion
;;; Looks promising
;;;----------------------------------------------------------------------
;;; 2019-09-24
;;; Disabled this feature for now. Found it annoying instead of being helpful.
;;;----------------------------------------------------------------------
;;; 2021-07-22 (Thu)
;;; Re-enabled it again for Rust configuration
;;;----------------------------------------------------------------------
(use-package company               
  :ensure t
  :defer t
  :custom
  (company-idle-delay 0.5)
  ;; :init (global-company-mode)
  ;; :config
  ;; (progn
  ;;   ;; Use Company for completion
  ;;   (bind-key [remap completion-at-point] #'company-complete company-mode-map)

  ;;   (setq company-tooltip-align-annotations t
  ;;         ;; Easy navigation to candidates with M-<n>
  ;;         company-show-numbers t)
  ;;   (setq company-dabbrev-downcase nil))
  ;; :diminish company-mode
  :bind
  (:map company-active-map
	      ("C-n". company-select-next)
	      ("C-p". company-select-previous)
	      ("M-<". company-select-first)
	      ("M->". company-select-last))
  (:map company-mode-map
	("<tab>". tab-indent-or-complete)
	("TAB". tab-indent-or-complete)))

;;; 2020-07-27 (Mon)
;;; Added yas-snippets to the system
;;; Use: 'yas/describe-tables' to show the snippets
(require 'validate)
(use-package yasnippet                  ; Snippets
  :ensure t
  :config
  (validate-setq
   yas-verbosity 1                      ; No need to be so verbose
   yas-wrap-around-region t)

  (with-eval-after-load 'yasnippet
    (validate-setq yas-snippet-dirs '(yasnippet-snippets-dir)))

  (yas-reload-all)
  ;; 2020-08-17: Need to turn off yas-snippet because it is highjacking
  ;; C-c & (org-mark-ring-goto)
  ;; --------------------
  ;; (yas-global-mode)
  (add-hook 'prog-mode-hook 'yas-minor-mode)
  (add-hook 'text-mode-hook 'yas-minor-mode)
  )

(use-package yasnippet-snippets         ; Collection of snippets
  :ensure t)

;;; 2020-08-09 (Sun)
;;; Added smart scan to the system
(use-package smartscan
  :config (global-smartscan-mode t))

;;; 2021-07-05 (Mon)
;;; The iconset is used by doom modeline
(use-package all-the-icons)

;;;This is a really cool modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-vibrant t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

;;; Enable if you want an online keybinding assistant
;;; I find this quite helpful 
(use-package which-key
  :ensure t
  :config
  (which-key-mode))

;;; 2021-07-06
;;; eshell does not take my path settings from shell init
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;;; 2021-07-11 (Sun)
(use-package org-superstar
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1))))


;;; ----------------------------------------------------------------------
;;; 2021-07-22 (Thu)
;;; Enabled Rust setup
;;; ----------------------------------------------------------------------
;; (use-package rust-mode
;;   :ensure t
;;   :config
;;   (add-hook 'rust-mode-hook
;; 			(lambda () (setq indent-tabs-mode nil)))
;;   (setq auto-mode-alist
;;       (cons '("\\.rs$" . rust-mode) auto-mode-alist)))

(use-package rustic
  :ensure t
  :bind (:map rustic-mode-map
              ("M-j" . lsp-ui-imenu)
              ("M-?" . lsp-find-references)
              ("C-c C-c l" . flycheck-list-errors)
              ("C-c C-c a" . lsp-execute-code-action)
              ("C-c C-c r" . lsp-rename)
              ("C-c C-c q" . lsp-workspace-restart)
              ("C-c C-c Q" . lsp-workspace-shutdown)
              ("C-c C-c s" . lsp-rust-analyzer-status))
  :config
  ;; uncomment for less flashiness
  ;; (setq lsp-eldoc-hook nil)
  ;; (setq lsp-enable-symbol-highlighting nil)
  ;; (setq lsp-signature-auto-activate nil)

  ;; comment to disable rustfmt on save
  (setq rustic-format-on-save t)
  (add-hook 'rustic-mode-hook 'rk/rustic-mode-hook))

(defun rk/rustic-mode-hook ()
  ;; so that run C-c C-c C-r works without having to confirm, but don't try to
  ;; save rust buffers that are not file visiting. Once
  ;; https://github.com/brotzeit/rustic/issues/253 has been resolved this should
  ;; no longer be necessary.
  (when buffer-file-name
    (setq-local buffer-save-without-query t)))

(use-package lsp-mode
  :ensure t
  :commands lsp
  :custom
  ;; what to use when checking on-save. "check" is default, I prefer clippy
  (lsp-rust-analyzer-cargo-watch-command "clippy")
  (lsp-eldoc-render-all t)
  (lsp-idle-delay 0.6)
  (lsp-rust-analyzer-server-display-inlay-hints t)
  :config
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :custom
  (lsp-ui-peek-always-show t)
  (lsp-ui-sideline-show-hover t)
  (lsp-ui-doc-enable nil))

(defun company-yasnippet-or-completion ()
  (interactive)
  (or (do-yas-expand)
      (company-complete-common)))

(defun check-expansion ()
  (save-excursion
    (if (looking-at "\\_>") t
      (backward-char 1)
      (if (looking-at "\\.") t
        (backward-char 1)
        (if (looking-at "::") t nil)))))

(defun do-yas-expand ()
  (let ((yas/fallback-behavior 'return-nil))
    (yas/expand)))

(defun tab-indent-or-complete ()
  (interactive)
  (if (minibufferp)
      (minibuffer-complete)
    (if (or (not yas/minor-mode)
            (null (do-yas-expand)))
        (if (check-expansion)
            (company-complete-common)
          (indent-for-tab-command)))))

(use-package flycheck
  :ensure t)

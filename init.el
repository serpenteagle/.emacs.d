(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
	 ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes (quote (deeper-blue)))
 '(org-modules
	 (quote
		(org-bbdb org-bibtex org-docview org-gnus org-info org-irc org-mhe org-rmail org-w3m org-drill)))
 '(package-selected-packages
	 (quote
		(evil-org org-drill exec-path-from-shell smooth-scrolling markdown-mode evil-surround evil-commentary projectile ace-window which-key format-all evil))))

;; Set up MELPA
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
  ;; and `package-pinned-packages`. Most users will not need or want to do this.
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  )
(package-initialize)

;; Setup evil-mode
;; Override default C-u behaviour
(setq evil-want-C-u-scroll t)
(require 'evil)
(evil-mode 1)
(evil-commentary-mode)
(global-evil-surround-mode)

;; Set proper PATH
(exec-path-from-shell-initialize)

;; Set up projectile
(setq projectile-project-search-path '("~/Projects"))
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; Setup ace-window
(global-set-key (kbd "M-o") 'ace-window)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))

;; Enable which-key minor mode
(which-key-mode)

;; Enable relative line numbering
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

;; Scrole line-by-line
(require 'smooth-scrolling)
(smooth-scrolling-mode 1)

;; disable auto-save and auto-backup
(setq auto-save-default nil)
(setq make-backup-files nil)

;; Get rid of unnecesary UI elements
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; Make fringe bars transparent
(set-face-attribute 'fringe nil :background nil)

;; Enable soft-wrapping
(global-visual-line-mode)

;;Turn off vertical fringes
(fringe-mode '(0 . 0))

;; Highlight matching brackets 
(show-paren-mode)

;; Auto-complete brackets
(electric-pair-mode)

(setq-default tab-width 2)

;; Custom keybindings
(global-set-key (kbd "C-c f") 'format-all-buffer)
(global-set-key (kbd "C-c e") 'eval-buffer)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;;; --PACKAGES-----------------------------------------------------------

;; Set up package.el to work with MELPA
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
    (package-install 'use-package))

;;;; --USE-PACKAGE--------------------------------------------------------

(require 'use-package)
(setq use-package-always-ensure t)

;;;; --EVIL--(and general vim stuff)--------------------------------------

; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(use-package evil
  :config
  (evil-mode 1))

;;;; --IVY----------------------------------------------------------------

(use-package swiper)
(use-package counsel)
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

;;;; --DOOM-MODELINE------------------------------------------------------

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

;;;; --RAINBOW-DELIMITERS-------------------------------------------------

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;;;; --WHICH-KEY----------------------------------------------------------

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config (setq which-key-idle-delay 0.2))

;;;; --F------------------------------------------------------------------

(use-package f)

;;;; --VISUAL-------------------------------------------------------------

(load-theme 'wombat)

;; Set font settings
(set-face-attribute
 'default nil
 :font "Fira Code"
 :height (if (string= system-name "balthazar-2") 100 120))

;; Remove startup message
(setq inhibit-startup-message t)

;; Remove GUI elements
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 0)
(menu-bar-mode -1)

;; Turn on line-numbers
(column-number-mode)
(global-display-line-numbers-mode t)

;; Disable line numbers for some modes
(defvar no-line-num-modes '(org-mode-hook
			    term-mode-hook
			    shell-mode-hook
			    eshell-mode-hook))
(dolist (mode no-line-num-modes)
  (add-hook mode (lambda () (display-line-numbers-mode 0))))



;;;; --EMACS-GENERATED----------------------------------------------------

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(which-key rainbow-delimiters doom-modeline use-package evil counsel command-log-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

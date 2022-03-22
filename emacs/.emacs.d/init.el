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

(define-key evil-normal-state-map (kbd "SPC") nil)

(evil-set-leader 'normal (kbd "SPC"))

(defun leader (keys) (kbd (concat "<leader> " keys)))

(defun vsplit-and-enter ()
  (interactive)
  (evil-window-vsplit)
  (evil-window-right 1))

(defun split-and-enter ()
  (interactive)
  (evil-window-split)
  (evil-window-down 1))

(evil-define-key '(normal visual) 'global
  ;; General
  (leader "SPC") 'counsel-M-x
  ;; Help
  (leader "h") 'help
  ;; Buffers
  (leader "b b") 'counsel-ibuffer
  (leader "b n") 'evil-next-buffer
  ;; Files
  (leader "f f") 'counsel-find-file
  ;; Eval
  (leader "e b") 'eval-buffer
  (leader "e r") 'eval-region
  (leader "e s") 'eval-last-sexp
  ;; Window creation and deletion
  (leader "w d") 'evil-window-delete
  (leader "w /") 'vsplit-and-enter
  (leader "w -") 'split-and-enter
  ;; Move cursor between windows
  (leader "w h") 'evil-window-left
  (leader "w j") 'evil-window-down
  (leader "w k") 'evil-window-up
  (leader "w l") 'evil-window-right
  ;; Move windows
  (leader "w H") 'windmove-swap-states-left
  (leader "w J") 'windmove-swap-states-down
  (leader "w K") 'windmove-swap-states-up
  (leader "w L") 'windmove-swap-states-right)

;;;; --IVY----------------------------------------------------------------

(use-package swiper)
(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . counsel-minibuffer-history))
  :config (setq ivy-initial-inputs-alist nil)) ;; Delete ^ character from searches

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

(use-package ivy-rich
  :init (ivy-rich-mode 1))

;;;; --DOOM-MODELINE------------------------------------------------------

(use-package all-the-icons)

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
  :config (setq which-key-idle-delay 0.5))

;;;; --F------------------------------------------------------------------

(use-package f)

;;;; --VISUAL-------------------------------------------------------------

;; Need to find a bit better of a theme
(use-package doom-themes
  :init (load-theme 'doom-homage-black t))

;; Set font settings
(set-face-attribute
 'default nil
 :font "Fira Code"
 :height (cond
 	  ((string= system-name "balthasar-2") 100)
 	  ((string= system-name "casper-3") 110)
 	  (t 120)))

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

;;;; --FUNCTIONAL---------------------------------------------------------

;; Move backup tilde files ("example.txt~") to a special folder
(setq backup-directory-alist `(("." . "~/.emacs.bak")))

;;;; --EMACS-GENERATED----------------------------------------------------

(setq custom-file "~/.emacs.d/custom.el")
(when (file-exists-p custom-file)
  (load custom-file))

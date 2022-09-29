;;;; --PACKAGES-----------------------------------------------------------------

;; Set up package.el to work with MELPA
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://elpa.gnu.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
    (package-install 'use-package))

;;;; --USE-PACKAGE--------------------------------------------------------------

(eval-when-compile (require 'use-package))
(setq use-package-always-ensure t)

;;;; --GENERAL-EL---------------------------------------------------------------

(use-package general
  :config
  (general-evil-setup t)
  (general-auto-unbind-keys)
  (general-create-definer jklmn/leader-keys
			  :keymaps '(normal insert visual emacs)
			  :prefix "SPC"
			  :global-prefix "C-SPC"))

;;;; --EVIL--(and miscellaneous vim stuff)--------------------------------------

; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil) ;; Maybe I do want this :thinking_emoji:
  (setq evil-want-C-u-scroll t)
  ;; This fixes TAB in org-mode in terminal
  ;; https://jeffkreeftmeijer.com/emacs-evil-org-tab/ 
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  ;; Set C-h to work like backspace (works well if you remap caps to Ctrl)
  ; (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)
  ;; When lines wrap on edge of screen, j/k move to next "visual" line, not actual
  ; (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  ; (evil-global-set-key 'motion "k" 'evil-previous-visual-line)
  ;; Set normal mode as the default state for a couple of modes
  (evil-set-initial-state 'message-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(general-define-key
 :states 'normal
 :keymaps 'org-mode-map
 "RET" 'org-return)
; (define-key evil-visual-state-map (kbd "SPC") nil)
; 
; (evil-set-leader 'normal (kbd "SPC"))
; (evil-set-leader 'visual (kbd "SPC"))

; (defun leader (keys) (kbd (concat "<leader> " keys)))

(defun vsplit-and-enter ()
  (interactive)
  (evil-window-vsplit)
  (evil-window-right 1))

(defun split-and-enter ()
  (interactive)
  (evil-window-split)
  (evil-window-down 1))

(jklmn/leader-keys
  ;; Miscellaneous
  "SPC" 'counsel-M-x
  ;; Help
  "h" 'help
  ;; Buffers
  "b b" 'counsel-switch-buffer
  "b j" 'evil-next-buffer
  "b k" 'evil-prev-buffer
  "b d" 'kill-buffer
  ;; Files
  "f f" 'counsel-find-file
  ;; Eval
  "e b" 'eval-buffer
  "e r" 'eval-region
  "e s" 'eval-last-sexp
  ;; Window creation and deletion
  "w d" 'evil-window-delete
  "w /" 'vsplit-and-enter
  "w -" 'split-and-enter
  "w m" 'delete-other-windows
  ;; Move cursor between windows
  "w h" 'evil-window-left
  "w j" 'evil-window-down
  "w k" 'evil-window-up
  "w l" 'evil-window-right
  ;; Move windows
  "w H" 'windmove-swap-states-left
  "w J" 'windmove-swap-states-down
  "w K" 'windmove-swap-states-up
  "w L" 'windmove-swap-states-right)
  ;; )

;;;; --EVIL-COLLECTION----------------------------------------------------------

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

;;;; --HYDRA--------------------------------------------------------------------

(use-package hydra)

(defhydra hydra-text-scale (:timeout 2)
  "scale text"
  ("j" text-scale-increase "in")
  ("k" text-scale-decrease "out")
  ("f" nil "finished" :exit t))

(jklmn/leader-keys
  "ts" '(hydra-text-scale/body :which-key "scale text"))

;;;; --IVY----------------------------------------------------------------------

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
	 ("M-l" . ivy-alt-done)
	 ("M-j" . ivy-next-line)
	 ("M-k" . ivy-previous-line)
	 :map ivy-switch-buffer-map
	 ("M-k" . ivy-previous-line)
	 ("M-l" . ivy-done)
	 ("M-d" . ivy-switch-buffer-kill)
	 :map ivy-reverse-i-search-map
	 ("M-k" . ivy-previous-line)
	 ("M-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package ivy-rich
  :init (ivy-rich-mode 1))

;;;; --DOOM-MODELINE------------------------------------------------------------

(use-package all-the-icons)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

;;;; --RAINBOW-DELIMITERS-------------------------------------------------------

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;;;; --WHICH-KEY----------------------------------------------------------------

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config (setq which-key-idle-delay 0.5))

;;;; --F------------------------------------------------------------------------

;; https://github.com/rejeep/f.el

(use-package f)

;;;; --ORG-MODE-----------------------------------------------------------------

(general-define-key
 :states 'normal)

(use-package org
  :config (setq org-return-follows-link t))

;;;; --ESUP---------------------------------------------------------------------

(use-package esup
  :config (setq esup-depth 0))

;;;; --VISUAL-------------------------------------------------------------------

;; Need to find a bit better of a theme
(use-package doom-themes
  :init (load-theme 'doom-badger t))

;; Set font settings
(set-face-attribute
 'default nil
 :font "Jetbrains Mono"
 :height (cond
 	  ((string= system-name "balthasar-2") 100)
 	  ((string= system-name "casper-3") 110)
 	  (t 80)))

;; Remove startup message
(setq inhibit-startup-message t)

;; Remove GUI elements
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 0)
(menu-bar-mode -1)

;; Fill column
(setq fill-column 80)
(global-display-fill-column-indicator-mode t)

;; Turn on line-numbers
(column-number-mode)
(global-display-line-numbers-mode t)
(setq display-line-numbers 'relative)

;;;; --FUNCTIONAL---------------------------------------------------------------

;; Move backup tilde files ("example.txt~") to a special folder
(setq backup-directory-alist `(("." . "~/.emacs.bak")))

;;;; --EMACS-GENERATED----------------------------------------------------------

(setq custom-file "~/.emacs.d/custom.el")
(when (file-exists-p custom-file)
  (load custom-file))

(find-file "~/notes/daily.org")

;(add-to-list 'org-file-apps '("\\.pdf" . "zathura %s"))

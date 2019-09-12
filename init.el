;;package config

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(setq package-enable-at-startup nil)

(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("org"   . "http://orgmode.org/elpa/")
                         ("gnu"   . "http://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))

;;custom vars
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(suscolors))
 '(custom-safe-themes
   '("72559f34f255a17b7055687c1593ae1dbbd3c5b61b56d0ca96f9468ca228b96c" "a7051d761a713aaf5b893c90eaba27463c791cd75d7257d3a8e66b0c8c346e77" "11e57648ab04915568e558b77541d0e94e69d09c9c54c06075938b6abc0189d8" "c82d24bfba431e8104219bfd8e90d47f1ad6b80a504a7900cbee002a8f04392f" default))
 '(package-selected-packages
   '(emmet-mode fennel-mode evil-magit magit tuareg paredit scheme-complete rainbow-mode geiser yasnippet-snippets lsp-treemacs company-lsp lsp-ui yasnippet eglot suscolors-theme haskell-mode lsp-haskell molokai-theme flycheck intero flycheck-rust cargo rust-mode toml-mode dart-mode dart treemacs-projectile projectile rainbow-delimiters cider reason-mode ranger zenburn-theme company smartparens company-mode evil-leader treemacs-evil treemacs ivy evil use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 120 :width normal :family "hack")))))

;;minimal ui
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(setq inhibit-startup-screen t)
(setq backup-directory-alist `(("." . "~/.saves")))

;;-treemacs
(use-package treemacs
  :ensure t)

;;-evil mode
(use-package evil
  :ensure t
  :config
  (evil-mode 1))
(use-package evil-leader
  :ensure t
  :config
  (global-evil-leader-mode)
  (evil-leader/set-key
   "f" 'treemacs))

;;- ivy
(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t))

;;-flycheck
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode t))
;; - company
(use-package company
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'global-company-mode))

;;-smartparens
(use-package smartparens
  :ensure t
  :config
  (require 'smartparens-config)
  (add-hook 'prog-mode-hook 'smartparens-mode))

;;-lsp-mode
;;(use-package lsp-mode
;;  :hook ('prog-mode-hook . lsp)
;;  :commands lsp
  ;;:config
  ;;(require 'lsp-clients)
;;  )

;;- eglot
(use-package eglot
  :ensure t
  :config
  (add-to-list 'eglot-server-programs '(haskell-mode . ("hie-wrapper"))))

;;- also projectile
(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))
(use-package treemacs-projectile
  :ensure t)
;; optionally
(use-package lsp-ui :ensure t :commands lsp-ui-mode)
(use-package company-lsp
  :ensure t
  :commands company-lsp)
(use-package helm-lsp :commands helm-lsp-workspace-symbol)
(use-package lsp-treemacs :ensure t :commands lsp-treemacs-errors-list)

;;orgmode
(use-package org
  :ensure t
  :config
;; The following lines are always needed for org.
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-switchb))

;;magit -git for sane people

(use-package magit
  :ensure t
  :config
  (global-set-key (kbd "C-x g") 'magit-status))
(use-package evil-magit
  :ensure t)



;;--------------------------------------PL----------------------------------

;;-clojure
(use-package cider
  :ensure t
  :config
  (add-hook 'clojure-mode-hook 'cider-mode)
  (add-hook 'cider-repl-mode-hook #'cider-company-enable-fuzzy-completion)
  (add-hook 'cider-mode-hook #'cider-company-enable-fuzzy-completion))

(use-package rainbow-delimiters
    :ensure t
    :config (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))
(use-package paredit
  :ensure t
  :config (add-hook 'clojure-mode-hook 'paredit-mode))
;;haskell
(use-package haskell-mode
  :ensure t
  :config
  (add-hook 'haskell-mode-hook 'eglot-ensure))
(use-package lsp-haskell
  :ensure t
  :config
  (add-hook 'haskell-mode-hook #'lsp)
  (setq lsp-haskell-process-path-hie "hie-wrapper"))
(use-package intero
  :ensure t
  :config
  (add-hook 'haskell-mode-hook #'intero-mode))


(provide 'init)
;;; init ends here

;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line

(global-set-key (kbd "<mouse-2>") 'clipboard-yank)
(setq x-select-enable-clipboard t)
(setq create-lockfiles nil)
(require 'package)
(set-default 'truncate-lines t)
(setq inferior-lisp-program "sbcl")
(setq visible-bell t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

(add-to-list 'default-frame-alist '(width  . 90))
(add-to-list 'default-frame-alist '(height  . 30))
(add-to-list 'default-frame-alist '(font . "Monospace-13:weight=bold"))

(when (version<= "28.0.50" emacs-version )
  (global-display-line-numbers-mode))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/")t)
(add-to-list 'package-archives '("org". "https://orgmode.org/elpa/"))

(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; System Crafters EXWM code

;;  (exwm-workspace-rename-buffer exwm-class-name))
;;
;;(use-package exwm
;;  :config
;;  ;; Set the default number of workspaces
;;  (setq exwm-workspace-number 5)

  ;; When window "class" updates, use it to set the buffer name
;;  (add-hook 'exwm-update-class-hook #'efs/exwm-update-class)
;;
;;  ;; Rebind CapsLock to Ctrl
;;  (start-process-shell-command "xmodmap" nil "xmodmap ~/.emacs.d/exwm/Xmodmap")
;;
;;  ;; Set the screen resolution (update this to be the correct resolution for your screen!)


;; Added by Package.el.  This must come before configurat
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(require 'airline-themes)
(load-theme 'airline-angr t)


 (eval-after-load 'gnutls
   '(add-to-list 'gnutls-trustfiles "/etc/ssl/cert.pem"))
 (unless (package-installed-p 'use-package)
   (package-refresh-contents)
   (package-install 'use-package))
 (eval-when-compile
   (require 'use-package))

;;(define-key key-translation-map "SPC" 'event-apply-control-modifier)

 (use-package evil
   :init
   (setq evil-want-integration t)
   (setq evil-want-keybinding nil)
   (setq evil-want-C-u-scroll t)
   (setq evil-want-C-i-jump nil)
   :config
   (evil-mode 1)
   (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
   (define-key evil-insert-state-map (kbd "TAB") 'tab-to-tab-stop)
   (evil-global-set-key 'motion "j" 'evil-next-visual-line)
   (evil-global-set-key 'motion "k" 'evil-previous-visual-line)
   ;; custom keybindings
   (define-key evil-visual-state-map (kbd "v") 'evil-visual-block)

;;   (define-key evil-normal-state-map (kbd "SPC") 'event-apply-control-modifier)
   (evil-set-initial-state 'messages-buffer-mode 'normal)
   (evil-set-initial-state 'dashboard-mode 'normal)) (require 'bind-key)
  (setq use-package-always-ensure t)



(add-hook 'neotree-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-quick-look)
            (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
            (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "g") 'neotree-refresh)
            (define-key evil-normal-state-local-map (kbd "n") 'neotree-next-line)
            (define-key evil-normal-state-local-map (kbd "p") 'neotree-previous-line)
            (define-key evil-normal-state-local-map (kbd "A") 'neotree-stretch-toggle)
            (define-key evil-normal-state-local-map (kbd "H") 'neotree-hidden-file-toggle)))

 
(global-undo-tree-mode)
(evil-set-undo-system 'undo-tree)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("4bca89c1004e24981c840d3a32755bf859a6910c65b829d9441814000cf6c3d0" "2cdc13ef8c76a22daa0f46370011f54e79bae00d5736340a5ddfe656a767fddf" "74ba9ed7161a26bfe04580279b8cad163c00b802f54c574bfa5d924b99daa4b9" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "8d7684de9abb5a770fbfd72a14506d6b4add9a7d30942c6285f020d41d76e0fa" "e1ef2d5b8091f4953fe17b4ca3dd143d476c106e221d92ded38614266cea3c8b" "188fed85e53a774ae62e09ec95d58bb8f54932b3fd77223101d036e3564f9206" "cae81b048b8bccb7308cdcb4a91e085b3c959401e74a0f125e7c5b173b916bf9" "54cf3f8314ce89c4d7e20ae52f7ff0739efb458f4326a2ca075bf34bc0b4f499" "c4bdbbd52c8e07112d1bfd00fee22bf0f25e727e95623ecb20c4fa098b74c1bd" "be9645aaa8c11f76a10bcf36aaf83f54f4587ced1b9b679b55639c87404e2499" "d5a878172795c45441efcd84b20a14f553e7e96366a163f742b95d65a3f55d71" "2f1518e906a8b60fac943d02ad415f1d8b3933a5a7f75e307e6e9a26ef5bf570" "dde8c620311ea241c0b490af8e6f570fdd3b941d7bc209e55cd87884eb733b0e" default))
 '(highlight-indent-guides-method 'character)
 '(package-selected-packages
   '(typescript-mode rainbow-identifiers typoscript-mode rjsx-mode flycheck tide vue-mode go-autocomplete auto-complete go-imports zygospore vterm-toggle git-gutter-fringe haml-mode helm-exwm company-box company dap-mode eterm-256color elixir-mode lsp-mode evil-tutor git-gutter-fringe+ evil-magit magit org-edna highlight-indent-guides counsel-projectile projectile which-key rainbow-delimiters all-the-icons centaur-tabs go-mode powerline use-package doom-themes doom ivy prettier-js web-mode neotree)))

(require 'haml-mode)

(require 'web-mode)

 (use-package doom-themes
   :config
   (setq doom-themes-enable-bold t
 		doom-themes-enable-italic t)
   (load-theme 'doom-one))

(use-package ivy
  :diminish
  :bind(("C-s" . swiper)
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
  :init
(ivy-mode 1))

(use-package all-the-icons)

(use-package centaur-tabs
  :demand
  :config
  (setq centaur-tabs-style "bar"
   centaur-tabs-set-bar 'under
x-underline-at-descent-line t)
  (centaur-tabs-mode t)
  :bind
  (:map evil-normal-state-map
        ("g t". centaur-tabs-forward)
        ("g T". centaur-tabs-backward)))
  

(setq centaur-tabs-set-bar 'under)
(setq x-underline-at-descent-line t)


    (defun centaur-tabs-buffer-groups ()
      "`centaur-tabs-buffer-groups' control buffers' group rules.

    Group centaur-tabs with mode if buffer is derived from `eshell-mode' `emacs-lisp-mode' `dired-mode' `org-mode' `magit-mode'.
    All buffer name start with * will group to \"Emacs\".
    Other buffer group by `centaur-tabs-get-group-name' with project name."
      (list
	(cond
	 ((or (string-equal "*" (substring (buffer-name) 0 1))
	      (memq major-mode '(magit-process-mode
				 magit-status-mode
				 magit-diff-mode
				 magit-log-mode
				 magit-file-mode
				 magit-blob-mode
				 magit-blame-mode
				 )))
	  "Emacs")
	 ((derived-mode-p 'prog-mode)
	  "Editing")
	 ((derived-mode-p 'dired-mode)
	  "Dired")
	 ((memq major-mode '(helpful-mode
			     help-mode))
	  "Help")
	 ((memq major-mode '(org-mode
			     org-agenda-clockreport-mode
			     org-src-mode
			     org-agenda-mode
			     org-beamer-mode
			     org-indent-mode
			     org-bullets-mode
			     org-cdlatex-mode
			     org-agenda-log-mode
			     diary-mode))
	  "OrgMode")
	 (t
	  (centaur-tabs-get-group-name (current-buffer))))))

(add-to-list 'load-path "home/isaac/gocode")
(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))
(add-to-list 'auto-mode-alist '("\\.jsx?$" . web-mode))
(setq web-mode-content-types-alist '(("jsx" . "\\.js[x]'")))

(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))



(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

 (use-package which-key
   :init (which-key-mode)
   :diminish which-key-mode
   :config
   (setq which-key-idle-delay 0.3))

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (when (file-directory-p "~/Projects/Code")
    (setq projectile-project-search-path '("~/Projects/Code")))
  (setq projectile-switch-project-action #'projectile-dired))

(use-package magit
  :commands (magit-status magit-get-current-branch)
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

(use-package evil-magit
  :after magit)

(use-package git-gutter-fringe)

(use-package org)

 (use-package lsp-mode
   :commands (lsp lsp-deferred)
   :hook
   (elixir-mode . lsp)
   (go-mode-hook)
   :init
   (setq lsp-keymap-prefix "C-c l")
   (add-to-list 'exec-path "~/.emacs.d/lang-servers/elixir-ls-1.11")
   :config
   (lsp-enable-which-key-integration t))



(use-package term
  :config
  (setq explicit-shell-file-name "bash")
  (setq term-prompt-regexp "^[^#$%>\n]*[#$%>] *"))

(use-package dap-mode
  :config
  (require 'dap-node)
  (dap-node-setup)
  (general-define-key
   :keymaps 'lsp-mode-map
   :prefix lsp-keymap-prefix
   "d" '(dap-hydra t :wk "debugger")))

 (use-package company
   :after lsp-mode
   :hook (lsp-mode . company-mode)
   :bind (:map company-active-map
          ("<tab>" . company-complete-selection))
         (:map lsp-mode-map
          ("<tab>" . company-indent-or-complete-common))
   :custom
   (company-minimum-prefix-length 1)
   (company-idle-delay 0.0))

(use-package company-box
  :hook (company-mode . company-box-mode))

;; Related to gocode
(setenv "GOPATH" "/Users/isaac/gocode")

(add-to-list 'exec-path "/Users/isaac/gocode/bin")
(add-hook 'before-save-hook 'gofmt-before-save)

(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

(defun auto-complete-for-go ()
  (auto-complete-mode 1))
(add-hook 'go-mode-hook 'auto-complete-for-go)
(with-eval-after-load 'go-mode
   (require 'go-autocomplete))

(defun my-go-mode-hook ()
  ; Use goimports instead of go-fmt
  ; Call Gofmt before saving
  ; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))
  ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-*") 'pop-tag-mark)
)
(add-hook 'go-mode-hook 'my-go-mode-hook)

(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)

;;Vue JS
(setq vue-mode-packages
  '(vue-mode))

(setq vue-mode-excluded-packages '())

(defun vue-mode/init-vue-mode ()
  "Initialize my package"
  (use-package vue-mode))


;; TypeScript
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;;;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)

(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))
;; enable typescript-tslint checker
(flycheck-add-mode 'typescript-tslint 'web-mode)



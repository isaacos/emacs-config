(global-set-key (kbd "<mouse-2>") 'clipboard-yank)
(setq x-select-enable-clipboard t)
(setq create-lockfiles nil)
(require 'package)
(setq inferior-lisp-program "sbcl")
(setq visible-bell t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq electric-pair-pairs
      '(
        (?\" . ?\")
        (?\{ . ?\})))
(electric-pair-mode 1)

(add-to-list 'default-frame-alist '(width  . 90))
(add-to-list 'default-frame-alist '(height  . 30))
(add-to-list 'default-frame-alist '(font . "Monospace-12"))

(when (version<= "28.0.50" emacs-version )
  (global-display-line-numbers-mode))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/")t)
(add-to-list 'package-archives '("org". "https://orgmode.org/elpa/"))


(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(use-package org
  :hook (org-mode . efs/org-mode-setup)
  :config

  (setq org-agenda-start-with-log-mode t)
  (setq org-log-done `time)
  (setq org-log-into-drawer t)

  (setq org-agenda-files '("~/.emacs.d/agenda/tasks.org"))

  (setq org-refile-targets
        '(("~/.emacs.d/agenda/archive.org" :maxlevel . 1)))

  (setq org-capture-templates
        '(("t" "Tasks / Projects")
          ("tt" "tasks" entry (file+olp "~/.emacs.d/agenda/tasks.org" "TASKS")
           "* TODO %?\n %U\n %a\n %i" :empty-lines 1)
("tr" "reading" entry (file+olp "~/.emacs.d/agenda/tasks.org" "READING")
                                        "* TODO %?\n %U\n %a\n %i" :empty-lines 1)
          ))

  (advice-add 'org-refile :after 'org-save-all-org-buffers)

  (setq org-hide-emphasis-markers t))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(setq org-log-done t)

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
;;(require 'airline-themes)
;;(load-theme 'airline-angr t)
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))


 (eval-after-load 'gnutls
   '(add-to-list 'gnutls-trustfiles "/etc/ssl/cert.pem"))
 (unless (package-installed-p 'use-package)
   (package-refresh-contents)
   (package-install 'use-package))
 (eval-when-compile
   (require 'use-package))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("00cec71d41047ebabeb310a325c365d5bc4b7fab0a681a2a108d32fb161b4006" "f64189544da6f16bab285747d04a92bd57c7e7813d8c24c30f382f087d460a33" "a82ab9f1308b4e10684815b08c9cac6b07d5ccb12491f44a942d845b406b0296" "5f19cb23200e0ac301d42b880641128833067d341d22344806cdad48e6ec62f6" "4b6b6b0a44a40f3586f0f641c25340718c7c626cbf163a78b5a399fbe0226659" "1d44ec8ec6ec6e6be32f2f73edf398620bb721afeed50f75df6b12ccff0fbb15" "1f1b545575c81b967879a5dddc878783e6ebcca764e4916a270f9474215289e5" "0d01e1e300fcafa34ba35d5cf0a21b3b23bc4053d388e352ae6a901994597ab1" "e2c926ced58e48afc87f4415af9b7f7b58e62ec792659fcb626e8cba674d2065" "846b3dc12d774794861d81d7d2dcdb9645f82423565bfb4dad01204fa322dbd5" "4b0e826f58b39e2ce2829fab8ca999bcdc076dec35187bf4e9a4b938cb5771dc" "0466adb5554ea3055d0353d363832446cd8be7b799c39839f387abb631ea0995" "1278c5f263cdb064b5c86ab7aa0a76552082cf0189acf6df17269219ba496053" "e8df30cd7fb42e56a4efc585540a2e63b0c6eeb9f4dc053373e05d774332fc13" "e19ac4ef0f028f503b1ccafa7c337021834ce0d1a2bca03fcebc1ef635776bea" "cf922a7a5c514fad79c483048257c5d8f242b21987af0db813d3f0b138dfaf53" "da53441eb1a2a6c50217ee685a850c259e9974a8fa60e899d393040b4b8cc922" "a6e620c9decbea9cac46ea47541b31b3e20804a4646ca6da4cce105ee03e8d0e" "b0e446b48d03c5053af28908168262c3e5335dcad3317215d9fdeb8bac5bacf9" "028c226411a386abc7f7a0fba1a2ebfae5fe69e2a816f54898df41a6a3412bb5" "b5803dfb0e4b6b71f309606587dd88651efe0972a5be16ece6a958b197caeed8" "a9a67b318b7417adbedaab02f05fa679973e9718d9d26075c6235b1f0db703c8" "9b54ba84f245a59af31f90bc78ed1240fca2f5a93f667ed54bbf6c6d71f664ac" "d6844d1e698d76ef048a53cefe713dbbe3af43a1362de81cdd3aefa3711eae0d" "47db50ff66e35d3a440485357fb6acb767c100e135ccdf459060407f8baea7b2" "6c531d6c3dbc344045af7829a3a20a09929e6c41d7a7278963f7d3215139f6a7" "23c806e34594a583ea5bbf5adf9a964afe4f28b4467d28777bcba0d35aa0872e" "7eea50883f10e5c6ad6f81e153c640b3a288cd8dc1d26e4696f7d40f754cc703" "1d5e33500bc9548f800f9e248b57d1b2a9ecde79cb40c0b1398dec51ee820daf" "333958c446e920f5c350c4b4016908c130c3b46d590af91e1e7e2a0611f1e8c5" "f7fed1aadf1967523c120c4c82ea48442a51ac65074ba544a5aefc5af490893b" "234dbb732ef054b109a9e5ee5b499632c63cc24f7c2383a849815dacc1727cb6" "c5ded9320a346146bbc2ead692f0c63be512747963257f18cc8518c5254b7bf5" "f6665ce2f7f56c5ed5d91ed5e7f6acb66ce44d0ef4acfaa3a42c7cfe9e9a9013" "8d7b028e7b7843ae00498f68fad28f3c6258eda0650fe7e17bfb017d51d0e2a2" "a0be7a38e2de974d1598cf247f607d5c1841dbcef1ccd97cded8bea95a7c7639" "8146edab0de2007a99a2361041015331af706e7907de9d6a330a3493a541e5a6" "266ecb1511fa3513ed7992e6cd461756a895dcc5fef2d378f165fed1c894a78c" "6c98bc9f39e8f8fd6da5b9c74a624cbb3782b4be8abae8fd84cbc43053d7c175" "da186cce19b5aed3f6a2316845583dbee76aea9255ea0da857d1c058ff003546" "613aedadd3b9e2554f39afe760708fc3285bf594f6447822dd29f947f0775d6c" "7a7b1d475b42c1a0b61f3b1d1225dd249ffa1abb1b7f726aec59ac7ca3bf4dae" "835868dcd17131ba8b9619d14c67c127aa18b90a82438c8613586331129dda63" "6c3b5f4391572c4176908bb30eddc1718344b8eaff50e162e36f271f6de015ca" "730a87ed3dc2bf318f3ea3626ce21fb054cd3a1471dcd59c81a4071df02cb601" "711efe8b1233f2cf52f338fd7f15ce11c836d0b6240a18fffffc2cbd5bfe61b0" "4bca89c1004e24981c840d3a32755bf859a6910c65b829d9441814000cf6c3d0" "2cdc13ef8c76a22daa0f46370011f54e79bae00d5736340a5ddfe656a767fddf" "74ba9ed7161a26bfe04580279b8cad163c00b802f54c574bfa5d924b99daa4b9" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "8d7684de9abb5a770fbfd72a14506d6b4add9a7d30942c6285f020d41d76e0fa" "e1ef2d5b8091f4953fe17b4ca3dd143d476c106e221d92ded38614266cea3c8b" "188fed85e53a774ae62e09ec95d58bb8f54932b3fd77223101d036e3564f9206" "cae81b048b8bccb7308cdcb4a91e085b3c959401e74a0f125e7c5b173b916bf9" "54cf3f8314ce89c4d7e20ae52f7ff0739efb458f4326a2ca075bf34bc0b4f499" "c4bdbbd52c8e07112d1bfd00fee22bf0f25e727e95623ecb20c4fa098b74c1bd" "be9645aaa8c11f76a10bcf36aaf83f54f4587ced1b9b679b55639c87404e2499" "d5a878172795c45441efcd84b20a14f553e7e96366a163f742b95d65a3f55d71" "2f1518e906a8b60fac943d02ad415f1d8b3933a5a7f75e307e6e9a26ef5bf570" "dde8c620311ea241c0b490af8e6f570fdd3b941d7bc209e55cd87884eb733b0e" default))
 '(global-hl-line-mode 1)
 '(highlight-indent-guides-method 'character)
 '(org-agenda-files
   '("~/Documents/notes_on_reading/seminar_4_discussion_05252022.org" "~/.emacs.d/agenda/tasks.org"))
 '(package-selected-packages
   '(yasnippet smartparens idle-highlight-mode swiper json-mode evil-org term-toggle elixir-mode flycheck-elixir doom-themes doom-modeline typescript-mode rainbow-identifiers typoscript-mode rjsx-mode flycheck tide vue-mode go-autocomplete auto-complete go-imports zygospore vterm-toggle git-gutter-fringe haml-mode helm-exwm company-box company dap-mode eterm-256color lsp-mode evil-tutor git-gutter-fringe+ evil-magit magit org-edna highlight-indent-guides counsel-projectile projectile which-key rainbow-delimiters all-the-icons centaur-tabs go-mode powerline use-package doom ivy prettier-js web-mode neotree))
 '(truncate-lines t))

(require 'haml-mode)

(require 'web-mode)

 (use-package doom-themes
   :config
   (setq doom-themes-enable-bold t
 		doom-themes-enable-italic t)
   (load-theme 'doom-nova))

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

(use-package git-gutter-fringe)

(use-package org)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(setq org-startup-truncated nil) ;; wrap lines
;; TODO: Check that this hook works
;;(add-hook 'org-mode-hook company-mode)
;;(add-hook 'org-mode-hook (lambda ()
;;                            (setq buffer-face-mode-face '(:weight "normal"))
;;                            (buffer-face-mode)))
;;(add-hook 'org-mode-hook (lambda () (set-frame-font "Monospace-13:weight=normal" t)))

(use-package lsp-mode
   :commands lsp
   :ensure t
   :diminish lsp-mode
   :hook
   (elixir-mode . lsp)
   (js2-mode . lsp)
   :init
   (add-to-list 'exec-path "/home/isaac/.emacs.d/lang-servers/elixir-ls-1.12"))

(setq lsp-clients-elixir-server-executable "~/.emacs.d/lang-servers/elixir-ls/release/erl21/language_server.sh")
(add-hook 'js2-mode-hook #'lsp)

(add-hook 'elixir-mode-hook
          (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(autoload 'js2-mode "Major mode for typescript files" t)

(use-package clojure-mode
  :ensure t
  :mode (("\\.clj\\'" . clojure-mode)
         ("\\.edn\\'" . clojure-mode))
  :init
  (add-hook 'clojure-mode-hook #'yas-minor-mode)
  (add-hook 'clojure-mode-hook #'linum-mode)
  (add-hook 'clojure-mode-hook #'subword-mode)
  (add-hook 'clojure-mode-hook #'smartparens-mode)
  (add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'clojure-mode-hook #'eldoc-mode)
  (add-hook 'clojure-mode-hook #'idle-highlight-mode))

(use-package cider
  :ensure t
  :defer t
  :init (add-hook 'cider-mode-hook #'clj-refactor-mode)
  :diminish subword-mode
  :config
  (setq nrepl-log-messages t                  
        cider-repl-display-in-current-window t
        cider-repl-use-clojure-font-lock t    
        cider-prompt-save-file-on-load 'always-save
        cider-font-lock-dynamically '(macro core function var)
        nrepl-hide-special-buffers t            
        cider-overlays-use-font-lock t)         
  (cider-repl-toggle-pretty-printing))

(use-package dap-mode
  :config
  (require 'dap-node)
  (dap-node-setup)
  (general-define-key
   :keymaps 'lsp-mode-map
   :prefix lsp-keymap-prefix
   "d" '(dap-hydra t :wk "debugger")))


(use-package term
  :config
  (setq explicit-shell-file-name "bash")
  (setq term-prompt-regexp "^[^#$%>\n]*[#$%>] *"))

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
  (require 'dap-node)
  (dap-node-setup)
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

(setq truncate-lines t)

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
   (define-key evil-insert-state-map (kbd "C-.") (kbd "|> "))
   (define-key evil-normal-state-map (kbd "C-<return>") 'evil-multiedit-match-and-next)

   (evil-set-initial-state 'messages-buffer-mode 'normal)
   (evil-set-initial-state 'dashboard-mode 'normal)) (require 'bind-key)
  (setq use-package-always-ensure t)

(add-hook 'neotree-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
            (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "g") 'neotree-refresh)
            (define-key evil-normal-state-local-map (kbd "n") 'neotree-next-line)
            (define-key evil-normal-state-local-map (kbd "p") 'neotree-previous-line)
            (define-key evil-normal-state-local-map (kbd "A") 'neotree-stretch-toggle)
            (define-key evil-normal-state-local-map (kbd "H") 'neotree-hidden-file-toggle)))
 
(global-undo-tree-mode)
(evil-set-undo-system 'undo-tree)
(use-package evil-multiedit)

(use-package general)

(general-create-definer my-leader-def 
  :prefix "SPC")

(my-leader-def
 :keymaps '(normal dired)
 "SPC" 'execute-extended-command
 "f s" 'save-buffer
 "b b" 'switch-to-buffer
 "b f" 'make-frame-or-other-frame
 "t n" 'neotree-toggle
 "t t" 'term-toggle-ansi
 "p f" 'projectile-find-file
 "o a" 'org-agenda
 "o c" 'org-capture
 "g s" 'magit-status
 "x s" 'save-buffer
 "x k" 'kill-buffer-and-window
 "x f" 'find-file
 )

(defun make-frame-or-other-frame ()
  (interactive)
  (cond
    ((> (length(frame-list)) 1) (other-frame 1))
    (t (make-frame))))


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

(defun efs/org-mode-setup ()
  (org-indent-mode)
  (visual-line-mode)
  (variable-pitch-mode 1)
  (auto-fill-mode 0)
  (setq evil-auto-indent nil))

(use-package evil-org
  :ensure t
  :after org
  :hook (org-mode . (lambda () evil-org-mode))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))


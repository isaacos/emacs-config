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
(add-to-list 'default-frame-alist '(font . "Fira Code-12"))

(setq pixel-dead-time 0) ; Never go back to the old scrolling behaviour.
(setq pixel-resolution-fine-flag t) ; Scroll by number of pixels instead of lines (t = frame-char-height pixels).
(setq mouse-wheel-scroll-amount '(1)) ; Distance in pixel-resolution to scroll each mouse wheel event.
(setq mouse-wheel-progressive-speed nil)

(tab-bar-mode t)
(setq tab-bar-close-button-show nil
      tab-bar-new-button-show nil)

(tool-bar-mode -1)
(scroll-bar-mode -1)

(recentf-mode 1)

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
(use-package doom-modeline
  :ensure t
  :init
  :hook (after-init . doom-modeline-mode))
(setq doom-modeline-buffer-encoding nil)
(add-hook 'neotree-mode-hook #'hide-mode-line-mode)


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
   '("3c93094d214c034a89ed81a4bba720a23b090f38f7923a442c879c2bd4dcce5b" "a55c6f55eacfa36389dffc8672420b80454db33b59843a1923f3e3054a4643ca" "d50da51d7dc41c7fc1ce9409a74fd7661540dc4bf54ef55148e59a7763318112" "d0a35d7f6d15d501525e2e134a7254096fc72ae42c0946458372bc7fd00a73ac" "73a183da135380d11ea344ccfe4e78dfe0a6ddcf09f59f050d373f7b4c397c19" "51e1ac68a9844a92b3402b30d3f9f568e15e2015812d4ee79819a489261f9d0a" "c8d99bb565b2412dd867f89eff95ac89ff33111680569db7436e5d6a8c912e64" "e8483bc21cf667971eabdbb01203e3a471de1b59a4e532368b7a20f5665d686a" "0ce768d3ea6d809292d12b22a5ff6de65e24a8d527e4e0885cf87640f42dff7d" "7343e856679eef5ad722f026037c92e5c60fc9eed6f38ef86b4170b3e524fee3" "fb2c27e7ad4a81c2f57bceeca0faeb1c84fb7a167c097b998e2a1ea314455fd6" "05b767a3f3a37ac46353fd88f194934d82eb6c3644c3b8da883752f57513e7aa" "47f3e55e4e3d570d5513d4cc58047dc059bd6ab3d135c796c4ccbfb77d4eb88b" "3199be8536de4a8300eaf9ce6d864a35aa802088c0925e944e2b74a574c68fd0" "7dc296b80df1b29bfc4062d1a66ee91efb462d6a7a934955e94e786394d80b71" "adaf421037f4ae6725aa9f5654a2ed49e2cd2765f71e19a7d26a454491b486eb" "ae426fc51c58ade49774264c17e666ea7f681d8cae62570630539be3d06fd964" "51c71bb27bdab69b505d9bf71c99864051b37ac3de531d91fdad1598ad247138" "683b3fe1689da78a4e64d3ddfce90f2c19eb2d8ab1bab1738a63d8263119c3f4" "7ea883b13485f175d3075c72fceab701b5bf76b2076f024da50dff4107d0db25" "7e068da4ba88162324d9773ec066d93c447c76e9f4ae711ddd0c5d3863489c52" "bf948e3f55a8cd1f420373410911d0a50be5a04a8886cabe8d8e471ad8fdba8e" "512ce140ea9c1521ccaceaa0e73e2487e2d3826cc9d287275550b47c04072bc4" "02f57ef0a20b7f61adce51445b68b2a7e832648ce2e7efb19d217b6454c1b644" "afa47084cb0beb684281f480aa84dab7c9170b084423c7f87ba755b15f6776ef" "e3daa8f18440301f3e54f2093fe15f4fe951986a8628e98dcd781efbec7a46f2" "570263442ce6735821600ec74a9b032bc5512ed4539faf61168f2fdf747e0668" "49acd691c89118c0768c4fb9a333af33e3d2dca48e6f79787478757071d64e68" "8d3ef5ff6273f2a552152c7febc40eabca26bae05bd12bc85062e2dc224cde9a" "1a1ac598737d0fcdc4dfab3af3d6f46ab2d5048b8e72bc22f50271fd6d393a00" "3fe1ebb870cc8a28e69763dde7b08c0f6b7e71cc310ffc3394622e5df6e4f0da" "443e2c3c4dd44510f0ea8247b438e834188dc1c6fb80785d83ad3628eadf9294" "467dc6fdebcf92f4d3e2a2016145ba15841987c71fbe675dcfe34ac47ffb9195" "9d29a302302cce971d988eb51bd17c1d2be6cd68305710446f658958c0640f68" "b54376ec363568656d54578d28b95382854f62b74c32077821fdfd604268616a" "7e377879cbd60c66b88e51fad480b3ab18d60847f31c435f15f5df18bdb18184" "e1f4f0158cd5a01a9d96f1f7cdcca8d6724d7d33267623cc433fe1c196848554" "a44e2d1636a0114c5e407a748841f6723ed442dc3a0ed086542dc71b92a87aee" "eca44f32ae038d7a50ce9c00693b8986f4ab625d5f2b4485e20f22c47f2634ae" "545ab1a535c913c9214fe5b883046f02982c508815612234140240c129682a68" "636b135e4b7c86ac41375da39ade929e2bd6439de8901f53f88fde7dd5ac3561" "89d9dc6f4e9a024737fb8840259c5dd0a140fd440f5ed17b596be43a05d62e67" "680f62b751481cc5b5b44aeab824e5683cf13792c006aeba1c25ce2d89826426" "631c52620e2953e744f2b56d102eae503017047fb43d65ce028e88ef5846ea3b" "0c83e0b50946e39e237769ad368a08f2cd1c854ccbcd1a01d39fdce4d6f86478" "60ada0ff6b91687f1a04cc17ad04119e59a7542644c7c59fc135909499400ab8" "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" "2dd4951e967990396142ec54d376cced3f135810b2b69920e77103e0bcedfba9" "0c08a5c3c2a72e3ca806a29302ef942335292a80c2934c1123e8c732bb2ddd77" "ddffe74bc4bf2c332c2c3f67f1b8141ee1de8fd6b7be103ade50abb97fe70f0c" "4fda8201465755b403a33e385cf0f75eeec31ca8893199266a6aeccb4adedfa4" "7a424478cb77a96af2c0f50cfb4e2a88647b3ccca225f8c650ed45b7f50d9525" "991ca4dbb23cab4f45c1463c187ac80de9e6a718edc8640003892a2523cb6259" "00cec71d41047ebabeb310a325c365d5bc4b7fab0a681a2a108d32fb161b4006" "f64189544da6f16bab285747d04a92bd57c7e7813d8c24c30f382f087d460a33" "a82ab9f1308b4e10684815b08c9cac6b07d5ccb12491f44a942d845b406b0296" "5f19cb23200e0ac301d42b880641128833067d341d22344806cdad48e6ec62f6" "4b6b6b0a44a40f3586f0f641c25340718c7c626cbf163a78b5a399fbe0226659" "1d44ec8ec6ec6e6be32f2f73edf398620bb721afeed50f75df6b12ccff0fbb15" "1f1b545575c81b967879a5dddc878783e6ebcca764e4916a270f9474215289e5" "0d01e1e300fcafa34ba35d5cf0a21b3b23bc4053d388e352ae6a901994597ab1" "e2c926ced58e48afc87f4415af9b7f7b58e62ec792659fcb626e8cba674d2065" "846b3dc12d774794861d81d7d2dcdb9645f82423565bfb4dad01204fa322dbd5" "4b0e826f58b39e2ce2829fab8ca999bcdc076dec35187bf4e9a4b938cb5771dc" "0466adb5554ea3055d0353d363832446cd8be7b799c39839f387abb631ea0995" "1278c5f263cdb064b5c86ab7aa0a76552082cf0189acf6df17269219ba496053" "e8df30cd7fb42e56a4efc585540a2e63b0c6eeb9f4dc053373e05d774332fc13" "e19ac4ef0f028f503b1ccafa7c337021834ce0d1a2bca03fcebc1ef635776bea" "cf922a7a5c514fad79c483048257c5d8f242b21987af0db813d3f0b138dfaf53" "da53441eb1a2a6c50217ee685a850c259e9974a8fa60e899d393040b4b8cc922" "a6e620c9decbea9cac46ea47541b31b3e20804a4646ca6da4cce105ee03e8d0e" "b0e446b48d03c5053af28908168262c3e5335dcad3317215d9fdeb8bac5bacf9" "028c226411a386abc7f7a0fba1a2ebfae5fe69e2a816f54898df41a6a3412bb5" "b5803dfb0e4b6b71f309606587dd88651efe0972a5be16ece6a958b197caeed8" "a9a67b318b7417adbedaab02f05fa679973e9718d9d26075c6235b1f0db703c8" "9b54ba84f245a59af31f90bc78ed1240fca2f5a93f667ed54bbf6c6d71f664ac" "d6844d1e698d76ef048a53cefe713dbbe3af43a1362de81cdd3aefa3711eae0d" "47db50ff66e35d3a440485357fb6acb767c100e135ccdf459060407f8baea7b2" "6c531d6c3dbc344045af7829a3a20a09929e6c41d7a7278963f7d3215139f6a7" "23c806e34594a583ea5bbf5adf9a964afe4f28b4467d28777bcba0d35aa0872e" "7eea50883f10e5c6ad6f81e153c640b3a288cd8dc1d26e4696f7d40f754cc703" "1d5e33500bc9548f800f9e248b57d1b2a9ecde79cb40c0b1398dec51ee820daf" "333958c446e920f5c350c4b4016908c130c3b46d590af91e1e7e2a0611f1e8c5" "f7fed1aadf1967523c120c4c82ea48442a51ac65074ba544a5aefc5af490893b" "234dbb732ef054b109a9e5ee5b499632c63cc24f7c2383a849815dacc1727cb6" "c5ded9320a346146bbc2ead692f0c63be512747963257f18cc8518c5254b7bf5" "f6665ce2f7f56c5ed5d91ed5e7f6acb66ce44d0ef4acfaa3a42c7cfe9e9a9013" "8d7b028e7b7843ae00498f68fad28f3c6258eda0650fe7e17bfb017d51d0e2a2" "a0be7a38e2de974d1598cf247f607d5c1841dbcef1ccd97cded8bea95a7c7639" "8146edab0de2007a99a2361041015331af706e7907de9d6a330a3493a541e5a6" "266ecb1511fa3513ed7992e6cd461756a895dcc5fef2d378f165fed1c894a78c" "6c98bc9f39e8f8fd6da5b9c74a624cbb3782b4be8abae8fd84cbc43053d7c175" "da186cce19b5aed3f6a2316845583dbee76aea9255ea0da857d1c058ff003546" "613aedadd3b9e2554f39afe760708fc3285bf594f6447822dd29f947f0775d6c" "7a7b1d475b42c1a0b61f3b1d1225dd249ffa1abb1b7f726aec59ac7ca3bf4dae" "835868dcd17131ba8b9619d14c67c127aa18b90a82438c8613586331129dda63" "6c3b5f4391572c4176908bb30eddc1718344b8eaff50e162e36f271f6de015ca" "730a87ed3dc2bf318f3ea3626ce21fb054cd3a1471dcd59c81a4071df02cb601" "711efe8b1233f2cf52f338fd7f15ce11c836d0b6240a18fffffc2cbd5bfe61b0" "4bca89c1004e24981c840d3a32755bf859a6910c65b829d9441814000cf6c3d0" "2cdc13ef8c76a22daa0f46370011f54e79bae00d5736340a5ddfe656a767fddf" "74ba9ed7161a26bfe04580279b8cad163c00b802f54c574bfa5d924b99daa4b9" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "8d7684de9abb5a770fbfd72a14506d6b4add9a7d30942c6285f020d41d76e0fa" "e1ef2d5b8091f4953fe17b4ca3dd143d476c106e221d92ded38614266cea3c8b" "188fed85e53a774ae62e09ec95d58bb8f54932b3fd77223101d036e3564f9206" "cae81b048b8bccb7308cdcb4a91e085b3c959401e74a0f125e7c5b173b916bf9" "54cf3f8314ce89c4d7e20ae52f7ff0739efb458f4326a2ca075bf34bc0b4f499" "c4bdbbd52c8e07112d1bfd00fee22bf0f25e727e95623ecb20c4fa098b74c1bd" "be9645aaa8c11f76a10bcf36aaf83f54f4587ced1b9b679b55639c87404e2499" "d5a878172795c45441efcd84b20a14f553e7e96366a163f742b95d65a3f55d71" "2f1518e906a8b60fac943d02ad415f1d8b3933a5a7f75e307e6e9a26ef5bf570" "dde8c620311ea241c0b490af8e6f570fdd3b941d7bc209e55cd87884eb733b0e" default))
 '(global-hl-line-mode 1)
 '(highlight-indent-guides-method 'character)
 '(org-agenda-files '("~/.emacs.d/agenda/tasks.org"))
 '(package-selected-packages
   '(consult-notes pandoc-mode denote marginalia languagetool writegood-mode sly-quicklisp org-pdftools popper hide-mode-line lispyville rjsx-mode company-box yasnippet json-mode term-toggle flycheck-elixir rainbow-identifiers typoscript-mode vue-mode go-imports zygospore haml-mode helm-exwm evil-magit org-edna highlight-indent-guides counsel-projectile doom prettier-js neotree))
 '(truncate-lines t)
 '(warning-suppress-types '(((flycheck syntax-checker)))))

(require 'haml-mode)

(require 'web-mode)

 (use-package doom-themes
   :config
   (setq doom-themes-enable-bold t
 		doom-themes-enable-italic t)
   (load-theme 'doom-one)

;;(custom-set-faces
;;  `(mode-line ((t (:background ,(doom-color 'dark-violet)))))
;;  `(font-lock-comment-face ((t (:foreground ,(doom-color 'base6))))))
   )

;; Load the theme of choice:
(load-theme 'ef-bio :no-confirm)

(defun dw/minibuffer-backward-kill (arg)
  "When minibuffer is completing a file name delete up to parent
folder, otherwise delete a word"
  (interactive "p")
  (if minibuffer-completing-file-name
      ;; Borrowed from https://github.com/raxod502/selectrum/issues/498#issuecomment-803283608
      (if (string-match-p "./" (minibuffer-contents))
          (zap-up-to-char (- arg) ?/)
        (delete-minibuffer-contents))
    (delete-backward-char arg)))

(setq read-file-name-completion-ignore-case t
      read-buffer-completion-ignore-case t
      completion-ignore-case t)

(use-package vertico
  :ensure t
  :bind (:map vertico-map
         ("C-j" . vertico-next)
         ("C-k" . vertico-previous)
         ("C-f" . vertico-exit)
         :map minibuffer-local-map
         ("DEL" . dw/minibuffer-backward-kill))
  :custom
  (vertico-cycle t)
  :init
(vertico-mode))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(defun dw/get-project-root ()
  (when (fboundp 'projectile-project-root)
    (projectile-project-root)))

(setq completion-ignore-case  t)
(use-package consult
  :bind (("C-s" . consult-line)
         ("C-M-l" . consult-imenu)
         :map isearch-mode-map
         ("M-e" . consult-isearch-history)         ;; orig. isearch-edit-string
         ("M-s e" . consult-isearch-history)       ;; orig. isearch-edit-string
         ("M-s l" . consult-line)                  ;; needed by consult-line to detect isearch
         ("M-s L" . consult-line-multi)            ;; needed by consult-line to detect isearch        ("C-M-j" . persp-switch-to-buffer*)
         :map minibuffer-local-map
         ("C-r" . consult-history))
  :custom
  (consult-project-root-function #'dw/get-project-root)
  (completion-in-region-function #'consult-completion-in-region))

(use-package marginalia
  :ensure t
  :config
  (marginalia-mode))

(use-package embark
  :bind
  (("C-." . embark-act)))

(use-package embark-consult
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(use-package denote)
(setq denote-known-keywords '("code" "history" "current events"))
(setq denote-directory (expand-file-name "/home/isaac/denote/"))
(setq denote-file-type nil)
(add-hook 'dired-mode-hook #'denote-dired-mode)

(use-package consult-notes
  ;; :straight (:type git :host github :repo "mclear-tools/consult-notes")
  :commands (consult-notes
             consult-notes-search-in-all-notes)
  :config
  (setq consult-notes-file-dir-sources '("Name"  key  "/home/isaac/denote/")) ;; Set notes dir(s), see below
  ;; Set org-roam integration OR denote integration, e.g.:
  (when (locate-library "denote")
    (consult-notes-denote-mode)))

(with-eval-after-load 'org-capture
  (add-to-list 'org-capture-templates
               '("n" "New note (with Denote)" plain
                 (file denote-last-path)
                 #'denote-org-capture
                 :no-save t
                 :immediate-finish nil
                 :kill-buffer t
                 :jump-to-captured t)))

;; renames buffer when the name starts with title
(defun org+-buffer-name-to-title ()
  "Rename buffer to value of #+title:."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (when (re-search-forward "^[[:space:]]*#\\+TITLE:[[:space:]]*\\(.*?\\)[[:space:]]*$" nil t)
      (rename-buffer (match-string 1)))))

(add-hook 'org-mode-hook #'org+-buffer-name-to-title)

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
  ;;:custom ((projectile-completion-system 'ivy))
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

;; Turn on indentation and auto-fill mode for Org files
(defun dw/org-mode-setup ()
  (org-bullets-mode)
  (org-indent-mode)
  (variable-pitch-mode 1)
  (auto-fill-mode 0)
  (visual-line-mode 1)
  (setq evil-auto-indent nil)
  (company-ispell)
  )


(use-package org
  :defer t
  :hook (org-mode . dw/org-mode-setup))

(use-package writegood-mode 
  :bind (("C-c g" . writegood-mode) 
         ("C-c C-g g" . writegood-grade-level) 
         ("C-c C-g e" . writegood-reading-ease)) 
  :hook text-mode)

 ;; (use-package langtool)
;; ;; Run the code bellow in terminal to use langtool
;; ;; mkdir -p $HOME/opt && curl -o langtool.zip https://languagetool.org/download/LanguageTool-stable.zip && unzip langtool.zip -d $HOME/opt/ && rm -f langtool.zip
 ;; (setq langtool-bin "/usr/bin/languagetool")
 ;; (setq langtool-language-tool-jar "/home/isaac/opt/LanguageTool-5.9/languagetool-commandline.jar")

(use-package languagetool
  :ensure t
  :defer t
  :commands (languagetool-check
             languagetool-clear-suggestions
             languagetool-correct-at-point
             languagetool-correct-buffer
             languagetool-set-language
             languagetool-server-mode
             languagetool-server-start
             languagetool-server-stop)
  :config
  (setq languagetool-java-arguments '("-Dfile.encoding=UTF-8")
        languagetool-console-command "/home/isaac/opt/LanguageTool-5.9/languagetool-commandline.jar"
        languagetool-server-command "/home/isaac/opt/LanguageTool-5.9/languagetool-server.jar"))


(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(setq org-startup-truncated nil) ;; wrap lines
(setq org-startup-indented t) ;; wrap lines

(eval-after-load 'org
  '(define-key org-mode-map (kbd "C-'") nil))

(use-package lsp-mode
   :commands lsp
   :ensure t
   :diminish lsp-mode
   :hook
   ((elixir-mode js-mode) . lsp)
   :init
   (add-to-list 'exec-path "/home/isaac/.emacs.d/lang-servers/elixir-ls-1.12"))

(add-hook 'js-mode-hook #'lsp)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js-mode))
(add-hook 'js-mode-hook 'js2-minor-mode)

(use-package clojure-mode
  :ensure t
  :mode (("\\.clj\\'" . clojure-mode)
         ("\\.edn\\'" . clojure-mode))
  :init
  (add-hook 'clojure-mode-hook #'yas-minor-mode)
  (add-hook 'clojure-mode-hook #'subword-mode)
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

(setq byte-compile-warnings '(cl-functions))

(use-package lispy
  :hook ((emacs-lisp-mode . lispy-mode)
         ))

 (use-package lispyville
    :hook ((lispy-mode . lispyville-mode))
    :config
    (lispyville-set-key-theme '(operators c-w 
                                slurp/barf-cp
                                prettify)))


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

(use-package emacs
  :init
  ;; TAB cycle if there are only few candidates
  ;; (setq completion-cycle-threshold 3)

  ;; Emacs 28: Hide commands in M-x which do not apply to the current mode.
  ;; Corfu commands are hidden, since they are not supposed to be used via M-x.
  ;; (setq read-extended-command-predicate
  ;;       #'command-completion-default-include-p)

  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (setq tab-always-indent 'complete))

 (use-package company
   :after lsp-mode
   :hook (lsp-mode . company-mode)
   :bind (:map company-active-map
          ("<tab>" . company-complete-selection))
         (:map lsp-mode-map
          ("<tab>" . company-indent-or-complete-common))
   :custom
   (company-minimum-prefix-length 1)
   (company-idle-delay 0.0)
   :init
   (add-hook 'org-mode-hook 'company-mode)


   :config
 (setq company-backends '(company-capf
                           company-keywords
                           company-semantic
                           company-ispell
                           company-files
                           company-etags
                           company-elisp
                           company-clang
                           company-cmake
                           company-yasnippet))
   (global-company-mode))

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

  (define-key evil-normal-state-map (kbd "C-<return>") 'evil-multiedit-match-and-next)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal)) (require 'bind-key)
  (setq use-package-always-ensure t)

(with-eval-after-load 'evil
  (with-eval-after-load 'company
    (define-key evil-insert-state-map (kbd "C-j") nil)
    (define-key evil-insert-state-map (kbd "C-k") nil)
    (evil-define-key nil company-active-map (kbd "C-j") #'company-select-next)
    (evil-define-key nil company-active-map (kbd "C-k") #'company-select-previous)))

(with-eval-after-load 'evil
  (with-eval-after-load 'corfu
    (define-key evil-insert-state-map (kbd "C-j") nil)
    (define-key evil-insert-state-map (kbd "C-k") nil)
    (evil-define-key nil corfu-map (kbd "C-j") #'corfu-next)
    (evil-define-key nil corfu-map (kbd "C-k") #'corfu-previous)))

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

(use-package popper
  :ensure t ; or :straight t
  :bind (("C-`"   . popper-toggle-latest)
         ("M-`"   . popper-cycle)
         ("C-M-`" . popper-toggle-type))
  :init
  (setq popper-reference-buffers
        '("\\*Messages\\*"
          "\\*Warnings\\*"
          "\\*Async Shell Command\\*"
          help-mode
          compilation-mode))
  (popper-mode +1)
  ;; (setq popper-mode-line (custom-set-faces))
  (popper-echo-mode +1)) 


 
(global-undo-tree-mode)
(evil-set-undo-system 'undo-tree)
(use-package evil-multiedit)

(add-hook 'doc-view-mode-hook
  (lambda ()
   (local-set-key (kbd "k") 'doc-view-scroll-down-or-previous-page)
   (local-set-key (kbd "j") 'doc-view-scroll-up-or-next-page)))


(use-package pdf-tools)

(add-hook 'pdf-view-mode-hook
          (lambda ()
            (local-set-key (kbd "j") 'pdf-view-scroll-up-or-next-page)
            (local-set-key (kbd "k") 'pdf-view-scroll-down-or-previous-page)))

(defun dwim/eval-buffer ()
    "evals buffer based on correct minor mode"
  (interactive)
  (setq mode major-mode)
  (cond ((equal mode 'emacs-lisp-mode) (eval-buffer))
        ((equal mode 'clojure-mode) (cider-eval-buffer))
        ((equal mode 'lisp-mode) (sly-eval-buffer))
        ((message "Can't run isaacos/eval-buffer in %s" mode))))

(use-package general)

(general-create-definer my-leader-def 
  :prefix "SPC")

(my-leader-def
 :keymaps '(package-menu normal dired doc-view pdf-view)
 "SPC" 'execute-extended-command
 "f s" 'save-buffer
 "b b" 'switch-to-buffer
 "b f" 'make-frame-or-other-frame
 "t n" 'neotree-toggle
 "t t" 'term-toggle-eshell
 "p f" 'projectile-find-file
 "c f" 'consult-find
 "o a" 'org-agenda
 "o c" 'org-capture
 "g s" 'magit-status
 "x s" 'save-buffer
 "x k" 'kill-buffer-and-window
 "x f" 'find-file
 "x 1" 'delete-other-windows
 "x 2" 'split-window-below
 "x 3" 'split-window-right
 "x 0" 'delete-window
 "e b" 'dwim/eval-buffer
 "e :" 'eval-expression
 )

;; allows user to paste inside minibuffer
(define-key minibuffer-local-map (kbd "C-p") 'yank)

(defun make-frame-or-other-frame ()
  (interactive)
  (cond
   ((> (length(frame-list)) 1) (other-frame 1))
   (t (make-frame))))

(use-package evil-org
  :ensure t
  :after org
  :hook (org-mode . (lambda () evil-org-mode))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))


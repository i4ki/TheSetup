
;;; Commentary.
;;; Example

;;; init.el --- My init file

;;; Code:

(add-to-list 'load-path (expand-file-name "~/.emacs.d/l"))

(defvar emacs-libs (expand-file-name "~/.emacs.d/l"))

(defvar i3-emacs-path (concat emacs-libs "/i3-emacs/"))
(defvar i3-manager-path (concat emacs-libs "/i3-manager/"))
(defvar go-mode-path (concat emacs-libs "/go-mode.el"))
(defvar auto-complete-path (concat emacs-libs "/auto-complete"))
(defvar popup-path (concat emacs-libs "/popup.el"))
(defvar goflymake-path (concat (getenv "GOPATH") "/src/github.com/dougm/goflymake"))
(defvar gocode-path (concat (getenv "GOPATH") "/src/github.com/nsf/gocode/emacs/"))

(add-to-list 'load-path i3-emacs-path)
(add-to-list 'load-path i3-manager-path)
(add-to-list 'load-path go-mode-path)
(add-to-list 'load-path auto-complete-path)
(add-to-list 'load-path popup-path)
(add-to-list 'load-path goflymake-path)
(add-to-list 'load-path gocode-path)

(setq make-backup-files nil)
(menu-bar-mode 0)
(tool-bar-mode 0)
(column-number-mode t)
(require 'ido)
(ido-mode t)

(require 'i3)
(require 'i3-integration)
(require 'i3-manager)

;; set the keybindings ( *Modify as you want* )

(global-set-key (kbd "C-c C-3") 'i3-manager-move-to-workspace)
(global-set-key (kbd "C-c C-n") 'i3-manager-new-workspace)
(global-set-key (kbd "C-c C-w") 'i3-manager-find-window)

;; Go
(require 'go-mode-autoloads)

(add-hook 'go-mode-hook (lambda ()
			  (add-hook 'before-save-hook 'gofmt-before-save)
			  ; Customize compile command to run go build
			  (if (not (string-match "go" compile-command))
			      (set (make-local-variable 'compile-command)
				   "golint; and go build -v ; and go test -v; and go vet"))
			  (local-set-key (kbd "M-.") 'godef-jump)
                          (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
			  (local-set-key (kbd "C-c C-c") 'compile)))

(require 'go-flymake)

(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes (quote (deeper-blue))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

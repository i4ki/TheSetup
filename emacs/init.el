(add-to-list 'load-path (expand-file-name "~/.emacs.d/l"))

(defvar i3-emacs-path "~/.emacs.d/l/i3-emacs/")
(defvar i3-manager-path "~/.emacs.d/l/i3-manager/")

(add-to-list 'load-path (expand-file-name i3-emacs-path))
(add-to-list 'load-path (expand-file-name i3-manager-path))

(setq make-backup-files nil)
(menu-bar-mode 0)
(tool-bar-mode 0)

(require 'i3)
(require 'i3-integration)

(require 'i3-manager)

;; set the keybindings ( *Modify as you want* )

(global-set-key (kbd "C-c C-3") 'i3-manager-move-to-workspace)
(global-set-key (kbd "C-c C-n") 'i3-manager-new-workspace)
(global-set-key (kbd "C-c C-w") 'i3-manager-find-window)
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

(add-to-list 'load-path (expand-file-name "~/.emacs.d/l"))

(defvar i3-emacs-path "~/.emacs.d/l/i3-emacs/")
(defvar i3-manager-path "~/.emacs.d/l/i3-manager/")

(add-to-list 'load-path (expand-file-name i3-emacs-path))
(add-to-list 'load-path (expand-file-name i3-manager-path))

(setq make-backup-files nil)

(require 'i3)
(require 'i3-integration)

(require 'i3-manager)

;; set the keybindings ( *Modify as you want* )

(global-set-key (kbd "C-c C-3") 'i3-manager-move-to-workspace)
(global-set-key (kbd "C-c C-n") 'i3-manager-new-workspace)
(global-set-key (kbd "C-c C-w") 'i3-manager-find-window)

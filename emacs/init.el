(add-to-list 'load-path (expand-file-name "~/.emacs.d/l"))

(defvar i3-emacs-path "~/.emacs.d/l/i3-emacs/")

(add-to-list 'load-path (expand-file-name i3-emacs-path))

(setq make-backup-files nil)

(require 'i3)
(require 'i3-integration)

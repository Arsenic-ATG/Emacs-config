;;; init.el --- -*- lexical-binding: t -*-
;;
;; Filename: init.el
;; Description: initialization file
;; Author: Ankur Saini
;; Copyright (C) 2019 Ankur Saini
;; Created: Sun Jun 19 13:31:54 2022 (+0530)
;; Version: 1.0
;; Last-Updated:
;;           By:
;;     Update #: 80
;; URL: https://github.com/Arsenic-ATG/Emacs-config
;; Keywords: init .emacs.d
;; Compatibility: emacs-version >= 26.1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;; Emacs initialization file ( or init file for short)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or (at
;; your option) any later version.
;;
;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <https://www.gnu.org/licenses/>.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

;;;;;;;;;;;;;;;
;; Load path ;;
;;;;;;;;;;;;;;;

(defun add-to-load-path (folder)
  "Add FOLDER and its subdirectories to `load-path'."
  (let ((base folder))
    (unless (member base load-path)
      (add-to-list 'load-path base))
    (dolist (f (directory-files base))
      (let ((name (concat base "/" f)))
        (when (and (file-directory-p name)
                   (not (equal f ".."))
                   (not (equal f ".")))
          (unless (member base load-path)
            (add-to-list 'load-path name)))))))

(add-to-load-path (expand-file-name "elisp" user-emacs-directory))

;; global configuration
(require 'init-global-config)

;;;;;;;;;;;;;;
;; Packages ;;
;;;;;;;;;;;;;;

;; package manager
(require 'init-package)

(require 'init-search)

(require 'init-avy)

(require 'init-which-key)

(require 'init-ace-window)

(require 'init-dired)

(require 'init-helpful)

;;;;;;;;;;;;;;;
;; UI config ::
;;;;;;;;;;;;;;;

(require 'init-ui-config)

(require 'init-theme)

(require 'init-beacon)

(require 'init-font)

(require 'init-dashboard)

(require 'init-tab-bar)

;;;;;;;;;;;;;;;;;;;;;;;;;
;; General Programming ;;
;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'init-lsp)

(require 'init-git)

(require 'init-projectile)

(require 'init-yasnippets)

(require 'init-syntax)

(require 'init-parens)

(require 'init-indent)

(require 'init-format)

(require 'init-edit)

(require 'init-header)

(require 'init-company)

(require 'init-expand-region)

;;;;;;;;;;;;;;;;;
;; Programming ;;
;;;;;;;;;;;;;;;;;

(require 'init-cc)

;;;;;;;;;;;;;;;;;;;;;;;
;; Techinal writting ;;
;;;;;;;;;;;;;;;;;;;;;;;

(require 'init-org)

(require 'init-pdf)

(require 'init-markdown)

;;;;;;;;;;
;; Misc ;;
;;;;;;;;;;

(require 'init-elcord)


(provide 'init)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init.el ends here

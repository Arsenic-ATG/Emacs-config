;;; init-dired.el --- -*- lexical-binding: t -*-
;;
;; Filename: init-dired.el
;; Description: initialize dired
;; Author: Ankur Saini
;; Copyright (C) 2019 Ankur Saini
;; Created: Sun Jun 19 18:32:40 2022 (+0530)
;; Version: 1.0
;; Package-Requires: ()
;; Last-Updated:
;;           By:
;;     Update #: 22
;; URL: https://github.com/Arsenic-ATG/Emacs-config
;; Keywords: dired .emacs.d
;; Compatibility:
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;; This file initialise Dired configuration.
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

;;;;;;;;;;;;;;;;;;
;; dired config ;;
;;;;;;;;;;;;;;;;;;

;; DiredPackage
(use-package dired
  :ensure nil
  :bind
  (("C-x C-j" . dired-jump))
  :custom
  (insert-directory-program "ls" dired-use-ls-dired t)
  ;; Always delete and copy recursively
  ;; GNU's "ls" is requried for --group-directories-first
  ;; (not preinstalled on macOS)
  (dired-listing-switches "-agho --group-directories-first")
  (dired-recursive-deletes 'always)
  (dired-recursive-copies 'always)
  ;; Auto refresh Dired, but be quiet about it
  (global-auto-revert-non-file-buffers t)
  (auto-revert-verbose nil)
  ;; Quickly copy/move file in Dired
  (dired-dwim-target t)
  ;; Move files to trash when deleting
  (delete-by-moving-to-trash t)
  ;; Load the newest version of a file
  (load-prefer-newer t)
  ;; Detect external file changes and auto refresh file
  (auto-revert-use-notify nil)
  (auto-revert-interval 3) ; Auto revert every 3 sec
  ;; Ignore buffer menu mode otherwise it would annoyingly refresh
  ;; even when working on buffer list.
  (global-auto-revert-ignore-modes '(Buffer-menu-mode))
  ;; kill the current buffer when selecting a new directory.
  ;; (Reduce dired buffer clutter)
  (dired-kill-when-opening-new-dired-buffer t)
  :config
  ;; Enable global auto-revert
  (global-auto-revert-mode t)
  :hook
  ;; Hide detailed infromation by default
  (dired-mode . dired-hide-details-mode))

;; Display small icons denoting the file type.
(use-package all-the-icons-dired
  :after dired
  :hook (dired-mode . all-the-icons-dired-mode)
  :init (setq all-the-icons-dired-monochrome nil))

;;;;;;;;;;;;;;;;;
;; dired Hacks ;;
;;;;;;;;;;;;;;;;;

;; Use different colors for differnt file types ( the colors used are
;; are from flate-theme)
;; TODO: changing color scheme according to the theme
(use-package dired-rainbow
  :after dired
  :config
  (progn
    (dired-rainbow-define-chmod directory "#ff5d8f" "d.*")
    (dired-rainbow-define document "#6cb2eb" ("docm" "doc" "docx" "odb" "odt" "pdb" "pdf" "ps" "rtf" "djvu" "epub" "odp" "ppt" "pptx" "org" "etx" "info" "markdown" "md" "mkd" "nfo" "pod" "rst" "tex" "textfile" "txt"))
    (dired-rainbow-define database "#a29bfe" ("xlsx" "xls" "csv" "accdb" "db" "mdb" "sqlite" "nc"))
    (dired-rainbow-define media "#f0aa85" ("mp3" "mp4" "MP3" "MP4" "avi" "mpeg" "mpg" "flv" "ogg" "mov" "mid" "midi" "wav" "aiff" "flac" "tiff" "tif" "cdr" "gif" "ico" "jpeg" "jpg" "png" "psd" "eps" "svg"))
    (dired-rainbow-define shell "#23d18c" ("awk" "bash" "bat" "sed" "sh" "zsh" "vim"))
    (dired-rainbow-define prog "#ffe066" ("asm" "lisp" "el" "c" "h" "c++" "h++" "hpp" "hxx" "cc" "cp" "cpp" "f" "for" "ftn" "f90" "f95" "f03" "f08" "s" "rs" "hi" "hs" "pyc" ".java" "py" "ipynb" "rb" "pl" "t" "msql" "mysql" "pgsql" "sql" "r" "clj" "cljs" "scala" "js"))
    (dired-rainbow-define executable "#e84855" ("exe" "msi"))
    (dired-rainbow-define-chmod executable-unix "#e84855" "-.*x.*")
    (dired-rainbow-define compressed "#a29bfe" ("7z" "zip" "bz2" "tgz" "txz" "gz" "xz" "z" "Z" "jar" "war" "ear" "rar" "sar" "xpi" "apk" "xz" "tar"))
    (dired-rainbow-define vc "#424b54" ("git" "gitignore" "gitattributes" "gitmodules"))
    ))

;; Collapse the directory path when there is only one unique path when
;; entering that directory
(use-package dired-collapse
  :after dired-rainbow)

;; List the subdirectories directly below the pointed directory
(use-package dired-subtree
  :after dired
  :bind (:map dired-mode-map
              ("i" . dired-subtree-insert)
              (";" . dired-subtree-remove)))

(provide 'init-dired)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-dired.el ends here

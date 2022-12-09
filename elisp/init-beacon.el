;;; init-theme.el ---  -*- lexical-binding: t -*-
;;
;; Filename: init-beacon.el
;; Description: initilize beacon
;; Author: Ankur Saini
;; Maintainer: Ankur Saini
;; Copyright (C) 2019 Ankur Saini
;; Created: Fri Dec  9 16:26:42 2022 (+0530)
;; Version: 1.0
;; Package-Requires: ()
;; Last-Updated:
;;           By:
;;     Update #: 1
;; URL:  https://github.com/Arsenic-ATG/Emacs-config
;; Keywords: theme beacon .emacs.d
;; Compatibility: emacs-version >= 26.1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;; beacon is a package required to be highlight the current position
;; of cursor by flashing a colored light on it.
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


;;;;;;;;;;;;;;;;;;;
;; cursor-beacon ;;
;;;;;;;;;;;;;;;;;;;

(use-package beacon
  :after
  doom-themes
  :config
  (beacon-mode)
  ;; use highlight color of current theme instead of default color.
  (defun my/update-beacon (&rest _)
    (setq beacon-color (face-background 'highlight)))
  (advice-add #'load-theme :after #'my/update-beacon)

  :custom
  (beacon-color (face-background 'highlight)))

(provide 'init-beacon)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-beacon.el ends here

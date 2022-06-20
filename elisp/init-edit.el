;;; init-edit.el --- -*- lexical-binding: t -*-
;;
;; Filename: init-edit.el
;; Description: Initialize editing config
;; Author: Ankur Saini
;; Maintainer:
;; Copyright (C) 2019 Ankur Saini
;; Created: Mon Jun 20 12:48:27 2022 (+0530)
;; Version: 1.0
;; Package-Requires: ()
;; Last-Updated:
;;           By:
;;     Update #: 16
;; URL: https://github.com/Arsenic-ATG/Emacs-config
;; Keywords: iedit .emacs.d edit ws-buttler clean-aindent
;; Compatibility: emacs-version >=26.1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;; This file initialise packages related to editing file.
;; Initialization include (iedit, we-buttler, clean-aident,
;; multiple-cursors)
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

(eval-when-compile
  (require 'init-global-config))

;; Highlight and replace multiple occurances of a text in the buffer
(use-package iedit
  :diminish)

;; clean auto-indent and backspace unindent
(use-package clean-aindent-mode
  :diminish
  :hook (prog-mode . clean-aindent-mode))

;; strip additional whitespaces at the end of lines
(use-package ws-butler
  :diminish
  :hook (prog-mode . ws-butler-mode))


(use-package multiple-cursors
  :bind ( ("C-S-c C-S-c" . mc/edit-lines)
          ( "C->" . mc/mark-next-like-this)
          ("C-<" . mc/mark-previous-like-this)
          ("C-c C-<". mc/mark-all-like-this)))

(provide 'init-edit)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-edit.el ends here

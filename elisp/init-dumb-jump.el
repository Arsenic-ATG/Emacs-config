;;; init-dumb-jump.el ---  -*-lexical-binding: t-*-
;;
;; Filename: init-dumb-jump.el
;; Description: Initialise dumb jump
;; Author: Ankur Saini
;; Maintainer:
;; Copyright (C) 2019 Ankur Saini
;; Created: Sun May 14 20:10:04 2023 (+0530)
;; Version:
;; Package-Requires: ()
;; Last-Updated:
;;           By:
;;     Update #: 4
;; URL: https://github.com/Arsenic-ATG/Emacs-config
;; Keywords: dumb-jump definition xref .emacs.d
;; Compatibility: emacs-version >= 28.1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;; This file initialise dumb-jump package which is responsible for
;; providing functionality to jump to definitions in a bunch of
;; programing languages.
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

(use-package dumb-jump
  :custom
  (dumb-jump-selector 'ivy)
  (xref-show-definitions-function #'xref-show-definitions-completing-read))

(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)

(provide 'init-dumb-jump)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-dumb-jump.el ends here

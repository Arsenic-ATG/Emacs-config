;;; init-font.el --- -*- lexical-binding: t -*-
;;
;; Filename: init-font.el
;; Description: Initialize font configuration
;; Author: Ankur Saini
;; Copyright (C) 2019 Ankur Saini
;; Created: Mon Jun 20 10:14:20 2022 (+0530)
;; Version: 1.0
;; Package-Requires: ()
;; Last-Updated:
;;           By:
;;     Update #: 9
;; URL:  https://github.com/Arsenic-ATG/Emacs-config
;; Keywords: font .emacs.d
;; Compatibility: emacs-version >= 26.1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;; This file initialise Font configurations of Emacs.
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

(defvar arsenic/default-font-size 150)

(set-face-attribute 'default nil :font "Fira Code" :height arsenic/default-font-size)

;; Set the fixed pitch face
(set-face-attribute 'fixed-pitch nil :font "Fira Code" :height 150)

;; Set the variable pitch face
(set-face-attribute 'variable-pitch nil :font "Cantarell" :height 152 :weight 'regular)

(provide 'init-font)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-font.el ends here

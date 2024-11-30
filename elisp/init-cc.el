;;; init-cc.el --- -*-lexical-binding: t-*-
;;
;; Filename: init-cc.el
;; Description: Initialise c/c++ configuration
;; Author: Ankur Saini
;; Copyright (C) 2019 Ankur Saini
;; Created: Mon Jun 20 13:05:07 2022 (+0530)
;; Version: 1.0
;; Package-Requires: ()
;; Last-Updated:
;;           By:
;;     Update #: 14
;; URL: https://github.com/Arsenic-ATG/Emacs-config
;; Keywords: c c++ cc .emacs.d
;; Compatibility: emacs-version >= 26.1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;; This file initialise every package dealing with C and C++
;; specifically
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

;; follow gnu coding formatting convention by defult
(setq c-default-style "gnu")

;; Provides syntax highlighting and indentation for CMakeLists.txt and
;; *.cmake source files.
(use-package cmake-mode)

;; font-locking for "Modern C++"
(use-package modern-cpp-font-lock
  :diminish t)

;; company-c-headers ( auto complete c header names )
(use-package company-c-headers)
(add-to-list 'company-backends 'company-c-headers)
;; let company c headers also complete c++ headers
;;
;; TODO: fetch this information form a variables insetaed of
;; hardcoding it here ( as the path might not be same for all the
;; devices using the configuration)
;; (add-to-list 'company-c-headers-path-system "/usr/local/Cellar/gcc/11.2.0/include/c++/11.2.0")

(provide 'init-cc)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-cc.el ends here

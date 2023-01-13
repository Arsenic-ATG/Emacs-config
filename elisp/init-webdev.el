;;; init-webdev.el --- -*- lexical-binding: t -*-
;;
;; Filename: init-webdev.el
;; Description: Initialize web-dev specific config
;; Author: Ankur Saini
;; Maintainer:
;; Copyright (C) 2019 Ankur Saini
;; Created: Mon Jan  9 16:16:32 2023 (+0530)
;; Version: 1.0
;; Package-Requires: ()
;; Last-Updated:
;;           By: Ankur Saini
;;     Update #: 12
;; URL: https://github.com/Arsenic-ATG/Emacs-config
;; Keywords: web-dev html css php web-mode
;; Compatibility: emacs-version >= 26.1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;; This file initialise pacakges related to editing web-files.
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

;;;;;;;;;;;;;;
;; web mode ;;
;;;;;;;;;;;;;;

(use-package web-mode
  :mode (
         ".html?$"
         ".php$"
         )
  :custom
  (web-mode-markup-indent-offset 2)
  (web-mode-css-indent-offset 2)
  (web-mode-code-indent-offset 2)
  (web-mode-style-padding 2)
  (web-mode-script-padding 2)
  (web-mode-enable-auto-closing t)
  (web-mode-enable-auto-opening t)
  (web-mode-enable-auto-pairing t)
  (web-mode-enable-auto-indentation t)
  :config
  ;; Let smartparens handle auto closing brackets as it does it better
  ;; https://github.com/hlissner/doom-emacs/blob/develop/modules/lang/web/%2Bhtml.el#L56
  (dolist (alist web-mode-engines-auto-pairs)
    (setcdr alist
            (cl-loop for pair in (cdr alist)
                     unless (string-match-p "^[a-z-]" (cdr pair))
                     collect (cons (car pair)
                                   (string-trim-right (cdr pair)
                                                      "\\(?:>\\|]\\|}\\)+\\'"))))))

(provide 'init-webdev)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-webdev.el ends here

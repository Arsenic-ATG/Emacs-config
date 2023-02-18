;;; init-rainbow.el --- -*- lexical-binding: t -*-
;;
;; Filename: init-rainbow.el
;; Description: Initialize rainbow mode
;; Author: Ankur Saini
;; Maintainer: Arsenic
;; Copyright (C) 2019 Ankur Saini
;; Created: Sat Feb 18 19:07:51 2023 (+0530)
;; Version: 1.0
;; Package-Requires: ()
;; Last-Updated:
;;           By:
;;     Update #: 3
;; URL:  https://github.com/Arsenic-ATG/Emacs-config
;; Keywords: rainbow hex hex-colors color .emacs.d
;; Compatibility: emacs-version >= 26.1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;; This file houses the configuration of rainbow-mode with is useful
;; to add incline color to the color names ( mostly hex names ) in
;; buffers.
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


(use-package rainbow-mode
  :hook
  (elisp-mode . rainbow/elisp-mode-custom)
  :config
  ;; When in elisp mode just color the hex colors and nothing else.
  (defun rainbow/elisp-mode-custom ()
    (setq rainbow-html-colors nil
          rainbow-latex-colors nil
          rainbow-r-colors nil
          rainbow-x-colors nil)))

(provide 'init-rainbow)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-rainbow.el ends here

;;; init-lsp.el --- -*-lexical-binding: t-*-
;;
;; Filename: init-lsp.el
;; Description: Initialise lsp configuration
;; Author: Ankur Saini
;; Maintainer: Ankur Saini
;; Copyright (C) 2019 Ankur Saini
;; Created: Fri Dec 30 13:12:49 2022 (+0530)
;; Version: 1.0
;; Package-Requires: ()
;; Last-Updated:
;;           By:
;;     Update #: 2
;; URL: https://github.com/Arsenic-ATG/Emacs-config
;; Keywords: lsp c c++ .emacs.d
;; Compatibility: emacs-version >= 26.1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;; This file initialise language server protocol package for Emacs so
;; that it can be used as an full blown IDE for different programing
;; languages.
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

(use-package lsp-mode
  :commands lsp
  :custom
  (lsp-keymap-prefix "C-x l")
  (lsp-auto-guess-root nil)
  (lsp-prefer-flymake nil) ; Use flycheck instead of flymake
  (lsp-enable-file-watchers nil)
  (lsp-enable-folding nil)
  (read-process-output-max (* 1024 1024))
  (lsp-keep-workspace-alive nil)
  (lsp-eldoc-hook nil)
  :bind (:map lsp-mode-map ("C-c C-f" . lsp-format-buffer))
  :hook ((java-mode python-mode go-mode rust-mode
          js-mode js2-mode typescript-mode web-mode
          c-mode c++-mode objc-mode) . lsp-deferred)
  :config
  (defun lsp-update-server ()
    "Update LSP server."
    (interactive)
    ;; Equals to `C-u M-x lsp-install-server'
    (lsp-install-server t)))

(provide 'init-lsp)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-lsp.el ends here

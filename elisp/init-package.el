;;; init-package.el --- -*- lexical-binding: t -*-
;;
;; Filename: init-package.el
;; Description: Initialize package manager
;; Author: Ankur Saini
;; Copyright (C) 2019 Ankur Saini
;; Created: Sun Jun 19 14:43:55 2022 (+0530)
;; Version: 1.0
;; Last-Updated:
;;           By:
;;     Update #: 26
;; URL: https://github.com/Arsenic-ATG/Emacs-config
;; Keywords: packages use-package .emacs.d
;; Compatibility: emacs-version >= 26.1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;; This file initialise and configure packages from ELPA repositories,
;; use-package setup and diminish
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


(require 'package)

;; Initialize package resources
(setq package-archives
      '(("GNU" . "http://elpa.gnu.org/packages/")
        ("MELPA" . "http://melpa.org/packages/")
        ("nonGNU" . "https://elpa.nongnu.org/nongnu/")
	("MELPA Stable" . "http://stable.melpa.org/packages/")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package manager config ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(unless (bound-and-true-p package--initialized)
  (setq package-enable-at-startup nil)          ; To prevent initializing twice
  (package-initialize))

;; set use-package-verbose to t for interpreted .emacs,
;; and to nil for byte-compiled .emacs.elc.
(eval-and-compile
  (setq use-package-verbose (not (bound-and-true-p byte-compile-current-file))))

;;;;;;;;;;;;;;;;;;;;;;;;
;; Use-Package config ;;
;;;;;;;;;;;;;;;;;;;;;;;;

;; Install use-package if not installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-and-compile
  (setq use-package-always-ensure t)
  (setq use-package-expand-minimally t)
  (setq use-package-compute-statistics t)
  (setq use-package-enable-imenu-support t))

(eval-when-compile
  (require 'use-package)
  (require 'bind-key))

;;;;;;;;;;;;;;
;; diminish ;;
;;;;;;;;;;;;;;

;; to remove certain minor modes from modeline
(use-package diminish)

(provide 'init-package)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-package.el ends here

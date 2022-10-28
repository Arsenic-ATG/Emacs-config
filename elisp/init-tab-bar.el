;;; init-tab-bar.el ---   -*- lexical-binding: t -*-
;;
;; Filename: init-tab-bar.el
;; Description: initialise tab bar mode
;; Author: Parv Sharma
;; Copyright (C) 2019 Ankur Saini
;; Created: Mon Oct 17 16:22:31 2022 (+0530)
;; Version: 1.0
;; Package-Requires: (tab-bar-mode)
;; Last-Updated:
;;           By:
;;     Update #: 19
;; URL: https://github.com/Arsenic-ATG/Emacs-config
;; Keywords: .emacs.d tab-bar tabs tab-bar-mode
;; Compatibility: emacs-version >= 27
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;; This filoe initialise configuration of tab bar mode ( which was by
;; default added to eamcs 27 and after )
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

(use-package tab-bar
  :diminish
  :bind
  ("s-}" . tab-next)
  ("s-{" . tab-previous)
  ("s-t" . tab-bar-new-tab)
  ("s-w" . tab-bar-close-tab)
  :custom
  (tab-bar-new-button nil)
  (tab-bar-close-button nil)
  (tab-bar-new-tab-choice "*dashboard*")
  (tab-bar-tab-hints t)
  (tab-bar-select-tab-modifiers '(super)))

(provide 'init-tab-bar)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-tab-bar.el ends here

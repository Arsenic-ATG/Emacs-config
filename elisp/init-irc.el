;;; init-irc.el ---  -*- lexical-binding: t -*-
;;
;; Filename: init-irc.el
;; Description: initialize ERC configuration
;; Author: Ankur Saini
;; Maintainer: Ankur Saini
;; Copyright (C) 2019 Ankur Saini
;; Created: Tue Feb 14 14:14:25 2023 (+0530)
;; Version: 1.0
;; Package-Requires: ()
;; Last-Updated:
;;           By:
;;     Update #: 2
;; URL:  https://github.com/Arsenic-ATG/Emacs-config
;; Keywords: irc erc .emacs.d
;; Compatibility: emacs-version >= 26.1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;; This file contains initial configuration of the Emacs IRC client (
;; ERC ), which can be used to group chatting online.  I personally
;; use it quite often when talking to open source communities which
;; take part in GSoC and similar programs.
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


(use-package erc
  :commands erc
  :custom
  (erc-server "irc.libera.chat")
  (erc-nick "Arsenic")
  (erc-user-full-name "Ankur Saini")
  (erc-track-shorten-start 8)
  ;; add more channels here which you want to autojoin
  (erc-autojoin-channels-alist '(("irc.libera.chat")))
  (erc-kill-buffer-on-part t)
  (erc-auto-query 'bury)
  (erc-fill-column 80)
  (erc-interpret-mirc-color t)
  (erc-fill-function 'erc-fill-static)
  (erc-fill-static-center 20)
  )

;; erc-hl-mode to highlight the nicknames of the members in the
;; channel
(use-package erc-hl-nicks
  :after erc)

(provide 'init-irc)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-irc.el ends here

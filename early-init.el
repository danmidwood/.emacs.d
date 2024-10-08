;;; early-init.el --- Config that can be loaded early and quick  -*- lexical-binding: t; -*-

;; Copyright (C) 2024  Daniel Midwood

;; Author: Daniel Midwood

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;;; Code:

(load "~/.emacs.d/crafted-emacs/modules/crafted-early-init-config")


;; Hide extra noise around this screen.
(setq inhibit-startup-screen t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

;; Prefer visual over noisy bell.
(setq visible-bell t)

;; Show the column number in the modeline.
(column-number-mode)
;; And line numbers down the side in each buffer.
(global-display-line-numbers-mode)

;; Store backups locally
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))

(provide 'early-init)
;;; early-init.el ends here

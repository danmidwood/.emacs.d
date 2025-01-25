;;; daniel-development-config.el --- Config for non-language specific development  -*- lexical-binding: t; -*-

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

;;; Indent with spaces instead of tabs
(setq-default indent-tabs-mode nil)

;;; Whitespace
(require 'whitespace)
;; Disabled because work code is severly non-compliant
;; (add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq whitespace-style (quote (face tabs trailing lines-tail tab-mark)))
(setq whitespace-line-column 120) ;; Set the line column limit to 120

(global-whitespace-mode 1)

(provide 'daniel-development-config)
;;; daniel-development-config.el ends here

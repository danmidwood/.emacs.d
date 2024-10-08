;;; daniel-lisp-config.el --- Shared Lisp config  -*- lexical-binding: t; -*-

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
(require 'paredit)
(require 'rainbow-delimiters)

(defun daniel-lisp-hook ()
  "Enable parens modes for nicer editing."
  (enable-paredit-mode)
  (rainbow-delimiters-mode 1)
  (show-paren-mode 1))

(provide 'daniel-lisp-config)
;;; daniel-lisp-config.el ends here

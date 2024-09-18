;;; daniel-elisp-config.el --- Elisp config  -*- lexical-binding: t; -*-

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


(require 'eldoc)
(require 'daniel-lisp-config)

(add-hook 'emacs-lisp-mode-hook #'package-lint-flymake-setup)
(add-hook 'emacs-lisp-mode-hook #'daniel-lisp-hook)

(provide 'daniel-elisp-config)
;;; daniel-elisp-config.el ends here


;;; daniel-clojure-package.el --- Packages for Clojure development  -*- lexical-binding: t; -*-

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

(require 'daniel-lisp-package)

(add-to-list 'package-selected-packages 'cider)
(add-to-list 'package-selected-packages 'clj-refactor)
(add-to-list 'package-selected-packages 'clojure-mode)
(add-to-list 'package-selected-packages 'company)
(add-to-list 'package-selected-packages 'flycheck-clojure)
(add-to-list 'package-selected-packages 'lsp-mode)
(add-to-list 'package-selected-packages 'lsp-ui)

(provide 'daniel-clojure-package)
;;; daniel-clojure-package.el ends here

;;; daniel-typescript-config.el --- Typescript config  -*- lexical-binding: t; -*-

;; Copyright (C) 2024  Daniel Midwood

;; Author: Daniel Midwood <danielmidwood@Daniels-MacBook-Pro.local>

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

(require 'typescript-mode)
(require 'lsp-mode)
;; (require 'tsx-mode)

(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.[jt]s[x]?\\'" . typescript-mode))

(setq typescript-indent-level 2)

(add-hook 'typescript-mode-hook #'lsp)
(provide 'daniel-typescript-config)
;;; daniel-typescript-config.el ends here

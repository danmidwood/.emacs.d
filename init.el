;;; init.el --- The entry point for my emacs config  -*- lexical-binding: t; -*-

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

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (and custom-file
           (file-exists-p custom-file))
  (load custom-file nil :nomessage))

(load "~/.emacs.d/crafted-emacs/modules/crafted-init-config")

(require 'crafted-osx-config)

(require 'daniel-theme-package)
(require 'daniel-development-package)
(require 'daniel-elisp-package)
(require 'daniel-clojure-package)
(require 'daniel-java-package)

(package-install-selected-packages :noconfirm)

(require 'daniel-theme-config)
(require 'daniel-development-config)
(require 'daniel-elisp-config)
(require 'daniel-clojure-config)
(require 'daniel-java-config)

(provide 'init)
;;; init.el ends here

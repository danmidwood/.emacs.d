;;; daniel-clojure-config.el --- Config for Clojure development  -*- lexical-binding: t; -*-

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

;; Location of my clojure binary
(add-to-list 'exec-path "/opt/homebrew/bin")
(setenv "PATH" (concat "/opt/homebrew/bin:" (getenv "PATH")))

(require 'daniel-lisp-config)

(require 'clojure-mode)
(add-hook 'clojure-mode-hook #'daniel-lisp-hook)
(setq clojure-align-forms-automatically t)
(setq clojure-indent-style 'always-indent)
(require 'cider)
(add-hook 'cider-repl-mode-hook 'daniel-lisp-hook)
;; Prefer lsp xref because it can open jars better.
;; - I don't know how this works exactly, the default for Cider is -90 which is
;; - a high priority, and the default for lsp is nil which is neutral. Setting
;; - Cider's depth to nil makes it equal to lsp and that seems to be sufficient
;; - that we can find definitions in jar files properly but I'm not sure if it's
;; - a fluke or intended to work that way.
;; - cider-find-var can be used directly if needed instead of xref.
(customize-set-variable 'cider-xref-fn-depth nil)
(require 'company)
(setq company-idle-delay 0.2)
(setq company-minimum-prefix-length 3)
(require 'eldoc)
(add-hook 'cider-mode-hook 'eldoc-mode)
(add-hook 'cider-repl-mode-hook 'eldoc-mode)
(require 'flycheck)
(flycheck-clojure-setup)
(require 'lsp)
;; Work project is large monorepo.
(setq lsp-file-watch-threshold 1500)
(add-hook 'clojure-mode-hook 'lsp)
(add-hook 'clojurescript-mode-hook 'lsp)
(add-hook 'clojurec-mode-hook 'lsp)
(add-to-list 'company-backends 'company-lsp)
(require 'lsp-ui)
(require 'lsp-ui-imenu)
(require 'clj-refactor)
(defun load-clojure-refactor ()
  "Load `clj-refactor' toooling and fix keybinding conflicts with cider."
  (when (locate-library "clj-refactor")
    (clj-refactor-mode 1)
    ;; keybindings mentioned on clj-refactor github page
    ;; conflict with cider, use this by default as it does
    ;; not conflict and is a better mnemonic
    (cljr-add-keybindings-with-prefix "C-c r")))
(add-hook 'clojure-mode-hook #'load-clojure-refactor)

;; Custom functions adding cider / scope capture interactions.
(load "~/.emacs.d/custom-modules/daniel-clojure-config/daniel-scope-capture")

(provide 'daniel-clojure-config)
;;; daniel-clojure-config.el ends here

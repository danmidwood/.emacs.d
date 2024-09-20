;;; daniel-scope-capture.el --- Function to interact with Scope Capture through Cider/nrepl  -*- lexical-binding: t; -*-

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

(require 'clojure-mode)
(require 'cider)

(defun escape-quotes (str)
  "Remove the outer escaped quotes from STR."
  (if (and (string-prefix-p "\"" str)
           (string-suffix-p "\"" str))
      (substring str 1 -1)
    str))

(defun go-to-ep (id)
  "Navigate to the location ID of a Scope Capture episode."
  (interactive "nep-id: ")
  (let* ((code-site-code (format "(:sc.ep/code-site (sc.api/ep-info %d))" id))
         (ep-info (nrepl-dict-get (cider-nrepl-sync-request:eval code-site-code) "value"))
         (path (when (string-match ":file \"\\([^\"]+\\)\"" ep-info)
                 (match-string 1 ep-info)))
         (line (when (string-match ":line \\([0-9]+\\)" ep-info)
                 (string-to-number (match-string 1 ep-info))))
         (column (when (string-match ":column \\([0-9]+\\)" ep-info)
                   (string-to-number (match-string 1 ep-info)))))
    (if (get-buffer path)
        (progn
          (switch-to-buffer path)
          (forward-line line)
          (move-to-column column))
      (if (file-exists-p path)
          (progn
            (find-file path)
            (forward-line line)
            (move-to-column column))
        (if (not (string-prefix-p "/" path))
            (let* ((find-abs-path-code (format "(dm/find-file-in-classpath \"%s\")" path))
                   (abs-path (escape-quotes (nrepl-dict-get (cider-nrepl-sync-request:eval find-abs-path-code) "value"))))
              (progn
                (message (format "Looking for file %s" abs-path))
                (if (file-exists-p abs-path)
                    (progn
                      (find-file abs-path)
                      (forward-line line)
                      (move-to-column column))
                  (message (format "Could not find file %s" path)))))
          (message (format "Unexpected file %s" path)))))))

(add-hook 'clojure-mode-hook
          (lambda ()
            (define-key clojure-mode-map (kbd "C-c C-g") 'go-to-ep)))

(add-hook 'cider-repl-mode-hook
          (lambda ()
            (define-key cider-repl-mode-map (kbd "C-c C-g") 'go-to-ep)))

(provide 'daniel-scope-capture)
;;; daniel-scope-capture.el ends here

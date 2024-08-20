;;; lzy-machine-local-config.el --- load machine local configuration based on machine name  -*- lexical-binding: t; -*-

;; Copyright (C) 2024  Zhiyou Liu

;; Author: Zhiyou Liu <zhiyouliu@Zhiyous-MacBook-Pro.local>
;; Keywords: c, c, c, c

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

;; set machine local variables in a package name the same as machine name
;; and save it in preload folder

;;; Code:

(defvar lzy-machine-name
  (downcase (replace-regexp-in-string "\\." "-" (car (split-string (shell-command-to-string "hostname"))))))

;; Function to try loading the package
(defun try-load-package (package-name)
  "Try to load PACKAGE-NAME. Log message if package is not found."
  (if (locate-library package-name)
      (progn
        (require (intern package-name))
        (message "Package '%s' loaded successfully." package-name))
    (message "No package with machine name ('%s')  is found." package-name)))


;; Try loading the package named after the machine's hostname
(try-load-package lzy-machine-name)


(provide 'lzy-machine-local-config)
;;; lzy-machine-local-config.el ends here

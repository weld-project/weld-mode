;;; weld-mode.el --- Emacs major mode for editing Weld code. -*- coding: utf-8; lexical-binding: t; -*-

;; Maintainer: The Weld Project
;; Language: Weld
;; Homepage: https://www.weld.rs

;; This file is not part of GNU Emacs.

;; create the list for font-lock.
;; each category of keyword is given a particular face
(setq weld-font-lock-keywords
      (let* (
            ;; define several category of keywords
            (weld-keywords '("if" "for" "let" "merge" "result"))
            (weld-types '("i8" "i16" "i32" "i64" "u8" "u16" "u32" "u64" "f32" "f64" "bool"))
            (weld-collections '("vec" "dict" "simd"))
            (weld-bools '("true" "false"))
            (weld-builders '("appender" "merger" "vecmerger" "dictmerger" "groupmerger"))

            ;; generate regex string for each category of keywords
            (weld-keywords-regexp (regexp-opt weld-keywords 'words))
            (weld-types-regexp (regexp-opt weld-types 'words))
            (weld-collections-regexp (regexp-opt weld-collections 'words))
            (weld-bools-regexp (regexp-opt weld-bools 'words))
            (weld-builders-regexp (regexp-opt weld-builders 'words))
            (weld-let-regexp "let \\([a-zA-Z0-9_]*\\) = ")
	    (weld-numbers-regexp "[-+]?\\b[0-9]*\\.?[0-9]+\\(?:[eE][-+]?[0-9]+\\)?\\b") ; see https://stackoverflow.com/a/14981436
	    )

        `(
          (,weld-keywords-regexp . font-lock-keyword-face)
          (,weld-types-regexp . font-lock-type-face)
          (,weld-collections-regexp . font-lock-type-face)
          (,weld-bools-regexp . font-lock-constant-face)
          (,weld-builders-regexp . font-lock-preprocessor-face)
          (,weld-let-regexp . (1 font-lock-variable-name-face))
          (,weld-numbers-regexp . font-lock-constant-face)
          )))


;;;###autoload
(define-derived-mode weld-mode c-mode "weld mode"
  "Major mode for editing Weld code."

  ;; Syntax highlighting
  (setq font-lock-defaults '((weld-font-lock-keywords)))
)
     
;; add the mode to the `features' list
(provide 'weld-mode)

;;; weld-mode.el ends here

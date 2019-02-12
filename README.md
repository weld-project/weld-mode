# weld-mode
Emacs major mode for Weld

Syntax highlighting for the Weld language. To use, add the lines
```
(add-to-list 'load-path "$WELD_MODE_DIRECTORY")
(autoload 'weld-mode "weld-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.weld\\'" . weld-mode))
```
to your `.emacs` file, replacing `$WELD_MODE_DIRECTORY` with the location of `weld-mode.el`.

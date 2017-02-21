;;;;
;; Lisp
;;;;

(require 'cl)
(setq-default inferior-lisp-program "sbcl")


(add-hook 'slime-mode-hook
          (lambda ()
            (require 'slime)
            (load (expand-file-name "~/.quicklisp/slime-helper.el"))

            (setq-default slime-net-coding-system 'utf-8-unix)

            (setq-default lisp-body-indent 2)
            (setq-default lisp-indent-function 'common-lisp-indent-function)))


(dolist (mode-hook '(slime-mode-hook
                     lfe-mode-hook
                     lisp-mode-hook
                     comint-mode-hook
                     lisp-interaction-mode-hook))
  (add-hook mode-hook 'paredit-mode)
  (add-hook mode-hook 'enable-paredit-mode)
  (add-hook mode-hook #'rainbow-delimiters-mode))

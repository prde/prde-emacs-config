;; Elpy, the Emacs Lisp Python Environment
;; Initialize package mode along with all the installed packages
(setenv "PYTHONPATH" "/usr/bin/python") 


(require 'elpy)
;; (prelude-require-packages '(elpy jedi))
(elpy-enable)
(elpy-use-ipython)
(setq elpy-rpc-backend "jedi")

(defun prelude-personal-python-mode-defaults ()
  "Personal defaults for Python programming."
  ;; Enable elpy mode
  (elpy-mode)
  ;; Jedi backend                                                                                       
  (jedi:setup)
  (setq jedi:complete-on-dot t)
  (auto-complete-mode)
  (jedi:ac-setup)
  (setq elpy-rpc-python-command "python")
  ;; (company-quickhelp-mode)
  )

(defun elpy-rpc--handle-unexpected-line (line)
  nil)

(setq prelude-personal-python-mode-hook 'prelude-personal-python-mode-defaults)

(add-hook 'python-mode-hook (lambda ()
                              (run-hooks 'prelude-personal-python-mode-hook)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-auto-complete t)
 '(elpy-mode-hook (quote (subword-mode hl-line-mode)))
 '(elpy-disable-backend-error-display t)
 '(elpy-rpc-python-command "python")
 '(elpy-rpc-timeout 3)
 '(python-shell-interpreter "ipython"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

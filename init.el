;;;;
;; Packages
;;;;

;; Define package repositories
(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))

;; Load and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.
;; This also sets the load path.
(package-initialize)

;; Download the ELPA archive description if needed.
;; This informs Emacs about the latest versions of all packages, and
;; makes them available for download.
(when (not package-archive-contents)
  (package-refresh-contents))

;; The packages you want installed. You can also install these
;; manually with M-x package-install
;; Add in your own as you wish:
(defvar my-packages
  '(;; Markdown
    markdown-mode

    ;; Eclipse Integration
    lsp-java

    ;; makes handling lisp expressions much, much easier
    ;; Cheatsheet: http://www.emacswiki.org/emacs/PareditCheatsheet
    paredit

    ;; key bindings and code colorization for Clojure
    ;; https://github.com/clojure-emacs/clojure-mode
    clojure-mode

    ;; extra syntax highlighting for clojure
    clojure-mode-extra-font-locking

    ;; integration with a Clojure REPL
    ;; https://github.com/clojure-emacs/cider
    cider
    ac-cider

    ;; LFE
    lfe-mode

    ;; allow ido usage in as many contexts as possible. see
    ;; customizations/navigation.el line 23 for a description
    ;; of ido
    ;; ido-ubiquitous

    ;; Enhances M-x to allow easier execution of commands. Provides
    ;; a filterable list of possible commands in the minibuffer
    ;; http://www.emacswiki.org/emacs/Smex
    smex

    ;; project navigation
    projectile

    ;; plantuml
    plantuml-mode

    ;; colorful parenthesis matching
    rainbow-delimiters

    ;; edit html tags like sexps
    tagedit

    ;; git integration
    magit

    ;; ipython
    ;; ipython

    ;; Python IDE
    elpy

))

;; On OS X, an Emacs instance started from the graphical user
;; interface will have a different environment than a shell in a
;; terminal window, because OS X does not run a shell during the
;; login. Obviously this will lead to unexpected results when
;; calling external utilities like make from Emacs.
;; This library works around this problem by copying important
;; environment variables from the user's shell.
;; https://github.com/purcell/exec-path-from-shell
(if (eq system-type 'darwin)
    (add-to-list 'my-packages 'exec-path-from-shell))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


;; Place downloaded elisp files in ~/.emacs.d/vendor. You'll then be able
;; to load them.
;;
;; For example, if you download yaml-mode.el to ~/.emacs.d/vendor,
;; then you can add the following code to this file:
;;
;; (require 'yaml-mode)
;; (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
;; 
;; Adding this code will make Emacs enter yaml mode whenever you open
;; a .yml file
(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "~/projects/flower")

;;;;
;; Customization
;;;;

;; Add a directory to our load path so that when you `load` things
;; below, Emacs knows where to look for the corresponding file.
(add-to-list 'load-path "~/.emacs.d/customizations")

;; Sets up exec-path-from-shell so that Emacs will use the correct
;; environment variables
;; (load "shell-integration.el")

;; These customizations make it easier for you to navigate files,
;; switch buffers, and choose options from the minibuffer.
(load "navigation.el")

;; These customizations change the way emacs looks and disable/enable
;; some user interface elements
(load "ui.el")

;; These customizations make editing a bit nicer.
(load "editing.el")

;; Hard-to-categorize customizations
(load "misc.el")

;; For editing lisps
(load "elisp-editing.el")

;; Org Mode
(load "setup-org.el")

;; Langauage-specific
(load "setup-lisp.el")
(load "setup-clojure.el")
(load "setup-haskell.el")
(load "setup-java.el")
(load "setup-js.el")
(load "setup-latex.el")
(load "setup-python.el")
(load "setup-plantuml.el")
(load "setup-scala.el")
(load "setup-private.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(company-auto-commit t)
 '(elpy-disable-backend-error-display t)
 '(elpy-mode-hook '(subword-mode hl-line-mode))
 '(elpy-rpc-python-command "python3")
 '(elpy-rpc-timeout 3)
 '(elpy-syntax-check-command "python3 -m pyflakes")
 '(package-selected-packages
   '(haskell-emacs haskell-mode flower kotlin-mode docker flycheck-package package-lint clomacs pyenv-mode projectile ensime scala-mode plantuml-mode graphviz-dot-mode slime lfe-mode markdown-mode markdown-mode+ tagedit smex rainbow-delimiters quack py-yapf pos-tip paredit magit ipython idomenu ido-ubiquitous geiser exec-path-from-shell elpy company-jedi company-ansible company-anaconda clojure-mode-extra-font-locking cider))
 '(plantuml-default-exec-mode 'jar)
 '(plantuml-jar-path "/usr/share/java/plantuml.jar")
 '(python-interactive t)
 '(python-interactive-executable "/usr/bin/ipython3")
 '(python-shell-interpreter "ipython3")
 '(python-shell-interpreter-args
   "--simple-prompt --pylab -c exec('__import__(\\'readline\\')') -i")
 '(safe-local-variable-values
   '((cider-cljs-lein-repl . "(do (user/go) (user/cljs-repl))")
     (cider-refresh-after-fn . "reloaded.repl/resume")
     (cider-refresh-before-fn . "reloaded.repl/suspend"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(unless (and (fboundp 'server-running-p)
             (server-running-p))
  (server-start))

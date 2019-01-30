;;; flower-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "flower" "flower.el" (23633 41285 432291 706000))
;;; Generated autoloads from flower.el

(autoload 'flower-show-task-info "flower" "\
Show task info in new buffer.
Argument TASK-ID Task identifier.

\(fn TASK-ID)" t nil)

(autoload 'flower-browse-task "flower" "\
Browse task in external browser by task id.
Argument TASK-ID Task identifier.

\(fn TASK-ID)" t nil)

(autoload 'flower-list-tasks "flower" "\
Show list of tasks for task tracker specified by 'flower-tracker' variable.

\(fn)" t nil)

(autoload 'flower-cycle-query "flower" "\
Change current task tracker query.
Argument QUERY-INDEX Index of the query.

\(fn QUERY-INDEX)" t nil)

(autoload 'flower-cycle-query-and-go "flower" "\
Change current task tracker query and show list of tasks.
Argument QUERY-INDEX Index of the query.

\(fn QUERY-INDEX)" t nil)

(autoload 'flower-org-show-task-info "flower" "\
Show task info in buffer specified by 'flower-buffer-task' variable.

\(fn)" t nil)

(autoload 'flower-open "flower" "\
Visit flower tracker task.
Argument TASK-ID Task identifier.

\(fn TASK-ID)" t nil)

;;;***

;;;### (autoloads nil nil ("flower-pkg.el") (23633 41285 435291 692000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; flower-autoloads.el ends here

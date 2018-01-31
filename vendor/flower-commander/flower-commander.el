(require 'clomacs)

(clomacs-defun flower-commander-get-task-wrapper
               get-task
               :lib-name "flower-commander"
               :namespace flower-commander.core
               :doc "Get task info from task tracker")

(defvar flower-commander-tracker nil
  "Task tracker URL")

(defvar flower-commander-buffer "*flower-commander-buffer*"
  "Buffer name to display results")

(defun flower-commander-show-task-info (task-id)
  (setq msg (if flower-commander-tracker
                (flower-commander-get-task-wrapper flower-commander-tracker task-id)
              "Please specify `flower-commander-tracker`"))
  (setq msg-stripped (replace-regexp-in-string "%" "%%" msg))
  (if flower-commander-buffer
      (progn
        (unless (get-buffer-window flower-commander-buffer 0)
          (pop-to-buffer flower-commander-buffer nil t))
        (with-current-buffer flower-commander-buffer
            (setf (buffer-string) msg-stripped)))
      (message "%s" msg-stripped)))

(provide 'flower-commander)

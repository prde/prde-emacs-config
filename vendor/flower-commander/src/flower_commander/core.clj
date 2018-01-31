(ns flower-commander.core
  (:require [flower.macros :as macros]
            [flower.credentials]
            [flower.tracker.core :as tracker.core]
            [flower.tracker.proto :as tracker.proto])
  (:import [org.jsoup Jsoup]
           [org.jsoup.nodes Document$OutputSettings]
           [org.jsoup.safety Whitelist]))

(defn get-tracker [tracker-url]
  (macros/with-default-credentials
    (tracker.core/get-tracker tracker-url)))

(defn parse-html [html]
  (let [document (Jsoup/parse html)
        not-pretty (.prettyPrint (Document$OutputSettings.) false)]
    (.outputSettings document not-pretty)
    (.append (.select document "br") "\\n")
    (.prepend (.select document "p") "\\n\\n")
    (Jsoup/clean (.replaceAll (.html document) "\\\\n" "\n")
                 ""
                 (Whitelist/none)
                 not-pretty)))

(defn get-task [tracker-url task-id]
  (let [tracker (get-tracker tracker-url)
        task (first (tracker.proto/get-tasks tracker [task-id]))]
    (str (get task :task-type "Task") " "
         (get task :task-id "?") ": "
         (get task :task-title "?") "\n"
         "Assignee: " (get task :task-assignee "?") "\n"
         "State: " (get task :task-state "?") "\n\n"
         (parse-html (get task :task-description "?")))))

{:repl {:plugins [[cider/cider-nrepl "0.20.0" :exclusions [org.clojure/tools.nrepl]]]
        :dependencies [[org.clojure/tools.namespace "0.2.11"]]}
 :user {:plugins [[cider/cider-nrepl "0.20.0" :exclusions [org.clojure/tools.nrepl]]
                  [lein-nvd "0.4.1" :exclusions [org.tcrawley/dynapath
                                                 org.slf4j/jcl-over-slf4j
                                                 org.apache.httpcomponents/httpcore
                                                 org.slf4j/slf4j-api]]]
        :dependencies [[org.clojure/tools.namespace "0.2.11"]]}}

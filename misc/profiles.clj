{:repl {:plugins [[cider/cider-nrepl "0.21.1" :exclusions [org.clojure/tools.nrepl]]
                  [lein-check-namespace-decls "1.0.1" :exclusions [cider/cider-nrepl]]]
        :dependencies [[org.clojure/tools.namespace "0.2.11"]]
        :plugins []}
 :user {:plugins [[cider/cider-nrepl "0.21.1" :exclusions [org.clojure/tools.nrepl]]
                  [lein-nvd "0.4.1" :exclusions [org.tcrawley/dynapath
                                                 org.slf4j/jcl-over-slf4j
                                                 org.apache.httpcomponents/httpcore
                                                 org.slf4j/slf4j-api]]
                  [lein-check-namespace-decls "1.0.1" :exclusions [cider/cider-nrepl]]]
        :dependencies [[org.clojure/tools.namespace "0.2.11"]]}}

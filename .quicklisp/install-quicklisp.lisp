
;; This script will install Quicklisp. You should run it as follows.
;; sbcl --script install-quicklisp.lisp

(load "~/.quicklisp/quicklisp.lisp")
(quicklisp-quickstart:install :path "~/.quicklisp/")

;;;; cl-postgres-plus-uuid.lisp

;;; The MIT License (MIT)
;;;
;;; Copyright (c) 2013 Michael J. Forster
;;;
;;; Permission is hereby granted, free of charge, to any person obtaining a copy
;;; of this software and associated documentation files (the "Software"), to deal
;;; in the Software without restriction, including without limitation the rights
;;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;;; copies of the Software, and to permit persons to whom the Software is
;;; furnished to do so, subject to the following conditions:
;;;
;;; The above copyright notice and this permission notice shall be included in all
;;; copies or substantial portions of the Software.
;;;
;;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;;; SOFTWARE.

(in-package "CL-POSTGRES-PLUS-UUID")

(defconstant +uuid-oid+ 2950
  "The value of the PostgreSQL Object Identifier (OID) for the UUID data type.

Obtained from the PostgreSQL pg_type system catalogue via the
following query:

    SELECT oid FROM pg_type WHERE typname = 'uuid';

See https://www.postgresql.org/docs/current/static/datatype-oid.html,
https://www.postgresql.org/docs/current/static/datatype-uuid.html, and
https://www.postgresql.org/docs/current/static/catalog-pg-type.html.")

(defun set-uuid-sql-reader (&optional (table cl-postgres:*sql-readtable*))
  (cl-postgres:set-sql-reader +uuid-oid+ #'uuid:make-uuid-from-string :table table))

(defmethod cl-postgres:to-sql-string ((arg uuid:uuid))
  (format nil "~(~A~)" arg))

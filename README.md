# cl-postgres-plus-uuid

cl-postgres-plus-uuid is a Common Lisp library that defines a
cl-postgres SQL reader for the PostgreSQL UUID type.

cl-postgres-plus-uuid depends on
[cl-postgres](http://marijnhaverbeke.nl/postmodern/cl-postgres.html)
and [UUID](https://github.com/dardoria/uuid).

cl-postgres-plus-uuid is being developed with
[SBCL](http://sbcl.org/), [CCL](http://ccl.clozure.com/), and
[LispWorks](http://www.lispworks.com/) on OS X.  cl-postgres-plus-uuid
is being deployed with SBCL on FreeBSD/AMD64 and Linux/AMD64.


### Installation

```lisp
(ql:quickload "cl-postgres-plus-uuid")
```

### Example

```lisp
(defvar *connection* (cl-postgres:open-database *dbname* *dbuser* *dbpassword* *dbhost*))

(cl-postgres:exec-query *connection* "SELECT uuid_generate_v4();" 'cl-postgres:list-row-reader)
=> (("ce29603b-59b8-4354-9e3c-3798a10451de"))

(cl-postgres-plus-uuid:set-uuid-sql-reader)

(cl-postgres:exec-query *connection* "SELECT uuid_generate_v4();" 'cl-postgres:list-row-reader)
=> ((C526D222-9A51-4453-99D1-FCC691826020))

(type-of (caar *))
=> UUID:UUID

(cl-postgres:close-database *connection*)
```

### License

cl-postgres-plus-uuid is distributed under the MIT license. See LICENSE.

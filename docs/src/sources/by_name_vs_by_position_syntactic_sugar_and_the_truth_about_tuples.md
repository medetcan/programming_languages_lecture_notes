# By Name vs By Position, Syntactic Sugar and The Truth About Tuples

* Both tuples and records are "each-of" constructs.
* Records are accessed via field names and tuples are accessed via position.
* A tuple is in fact a record in ML.
* A tuple is a record with named fields 1,2,3,4, ..., etc.
* Type signature for a tuple `t1 * t2 * t3 * ... * tn` is just another way of writing `{1:t1, 2:t2, 3:t3, ..., n:tn }`


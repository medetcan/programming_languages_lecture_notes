# Lists

* For any variable that has a tuples , any function that returns a tuple, etc. there has to be a type for a tuple and that type will determine the amount of "real data".
* Unlike pairs and tuples list can hold arbitrary number of elements
* Lists are set of contiguous elements.
* All of the elements of a list must be of same type.
* The empty list, with syntax [], has 0 elements. 
    * It is a value which evaluates to itself.
* Lists can be of any type `t` that has a signature like this `t list`.
* Signature of a empty list `'a list`
* You can create a list using series of expressions
    * `[e1, e2, e3, ..., en];`
* `e1::e2` here e1 evaluates to a value type t and e2 evaluates to a list type `t list` and the result is a new list that starts with the result of e1 and then is all the elements in e2.
* We can do bunch of stuff with lists but here we will just list three of the tools to operate on lists. 
    * `null lst` (`t list`) returns true when the list is empty false otherwise.
    * `hd lst` returns the first elements of the list.
    * `tl lst` returns the tail of a list (without the first element).
* Functions that make and use lists are almost always recursive because a lsit has an unknown length.

# Records: Another Approach to "Each-of" Types

* Records and Tuples are similar you can think of a record as named tuple.
* Records have fields and corresponding values.
* Example record declaraion as follows; `{foo : (1 + 2, true), bar : 5 * 6, baz : "String"}`
* Record declarations are not require type definition when declared, type inference can determine type signature of any record.
* Order of field does not matter for records.
* Accessing a record field as folows; `#foo e`
    * `e` must be of type record
    * `e` should have a field named `foo`
    * If corresponding value for named field `foo` has type `t` than the whole expression is type `t` 

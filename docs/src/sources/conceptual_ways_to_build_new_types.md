# Conceptual Ways to Build New Types

* Most of the programming languages have primitive and compound types.
* Primitive types in most of the programming languages are int,bool,real,... because these types directly map to computer architecture.
* Compound types are the types that contain other types in ther definition. 
* There are really only three essential building blocks to create a compound types.
    * **Each-of**
        * A compound type **t** that made up from combination of **t1, t2, t3, ..., tn** and contain corresponding values **v1, v2, v3, ..., vn**. Examples to "each-of";
	      * Class fields
	      * Tuples
    * **One-of**
        * A Compound type **t** describes values that contain a value of one of **t1, or t2, or t3, ..., or tn**. Examples:
	      * Tree
	      * Lists
	      * Subclassing in Java 
    * **Self-reference**
        * A Compound type **t** that may refer to itself in its definition.
        * To Implement recursive data structure like lists and tree, we need self referencing.


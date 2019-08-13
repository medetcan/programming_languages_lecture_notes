# Datatype Bindings: Our Own "One-of" Types

* Datatype bindings are the third type of binding we introduce after varibles bindings and function bindings.
* Example datatype binding introduced as follows;
    `datatype myType = TwoInts of int * int | Str of string | Pizza`
* Declared datatype binding above is a `one-of` type
* Names, TwoInts, Str, Pizza are tags, which we will call constructors.
    * Constructors define which variant a datatype binding is.
* The example above adds four things to the environment:
    * A new type `mytype` that we can now use just like any other type
    * Three constructors `TwoInts`, `Str`, `Pizza`
    * Constructors is for tagging each variant and wrapping values.
    * Constructors are also used for pattern matching.
    * A Constructor can either be a funcion or a value for example:
        * `TwoInts int * int -> mytype`
        * `Pizza : mytype`
* `option` is a datatype binding in ML and definition of `option` as follows
    * `datatype option 'a = SOME a' | NONE`

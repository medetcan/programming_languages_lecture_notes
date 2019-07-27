# Lack of Mutation and Benefits Thereof

* Lack of mutation in a language is benefical because we don't have to think about;
    * Aliasing or referencing. 
    * Shared state.

* Referencing or aliasing the same value is hard to reason about because any other binding can change the contents of the reference and must be accounted for when writing the program.
* Controlling shared state is very hard in multi-threaded programming.
* Lack of mutation in a programming language solves many of the problems in multi-threaded programming.
* Without shared state source code becomes easier to maintain.

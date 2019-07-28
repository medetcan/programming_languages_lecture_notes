
val a_pair = (3 + 1, 4 + 2);
val a_record = {second = 4 + 2, first = 3+ 1};
(* We can write a record like the following. It seems very similar to tuples *)
(* You can give numeric field names to record *)
(* Tuples are just syntactic sugar for records. You don't access tuple elements by their position those numbers are just a field names *)
val a_pair1 = (5,6);
val another_pair = {2=5, 1=6}; 

 #1 a_pair + #2 another_pair;

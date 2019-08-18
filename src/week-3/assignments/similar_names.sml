(* Write a function similar_names 
 * Which takes a string list list of substitutions and a full name of type {first:string,middle:string,last:string} and returns a list of fullnames
 * Result is contains the full names you can produce by substituting for the first name (and only the first name) using substitutions and parts (b) or (c).
 * The answer should begin with the original name (then have 0 or more other names).
 * *)


use "hw2provided.sml";
use "get_substitutions2.sml";

fun similar_names(xs : (string list) list, fullname : {first:string, middle:string, last:string})=
  case fullname of {first=fname, middle=_, last=_} => 
    let 
      fun append(fullname : {first:string, middle:string, last:string}, xs : string list)= 
        case xs of 
             [] => [] 
           | x::xs' => case fullname of {first=_, middle=y, last=z} => ({first = x, middle = y, last = z})::append(fullname, xs')
    in 
      append(fullname, fname::get_substitutions2(xs, fname))
    end;

 similar_names ([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], {first="Fred", middle="W", last="Smith"});

val test4 = similar_names ([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], {first="Fred", middle="W", last="Smith"}) = [
  {first="Fred", last="Smith", middle="W"}, 
  {first="Fredrick", last="Smith", middle="W"},
  {first="Freddie", last="Smith", middle="W"},
  {first="F", last="Smith", middle="W"} ]

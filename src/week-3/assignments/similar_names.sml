(* Write a function similar_names 
 * Which takes a string list list of substitutions and a full name of type {first:string,middle:string,last:string} and returns a list of fullnames
 * Result is contains the full names you can produce by substituting for the first name (and only the first name) using substitutions and parts (b) or (c).
 * The answer should begin with the original name (then have 0 or more other names).
 * *)


use "hw2provided.sml";

fun contains(str, xs)=
  case xs of
       [] => false
     | x::xs' => same_string(str, x) orelse contains(str, xs');

fun append(fullname : {first:string, middle:string, last:string}, xs : string list)=
    case xs of
        [] => []
       | x::xs' => 
        case fullname of 
              {first=_, middle=y, last=z} => ({first = x, middle = y, last = z})::append(fullname, xs');

fun similar_names(xs : (string list) list, fullname : {first:string, middle:string, last:string})=
  case xs of 
       [] => []
     | xs'::xs'' => 
         case fullname of
              {first=fname, middle=_, last=_} => if contains(fname, xs') then append(fullname, xs') @ similar_names(xs'', fullname) else similar_names(xs'', fullname);
         
similar_names([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],{first="Fred", middle="W", last="Smith"});

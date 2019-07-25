(*  Write a function get_nth.
 *  That takes a list of strings and an int n and returns the nth element of the list where the head of the list is 1st.  
 *  Do not worry about the case where the list has too few elements: your function may apply hd or tl to the empty list in this case, which is okay.
 *
 *)

 fun get_nth(stringList : string list, n : int)=
    if n = 1
    then hd stringList
    else get_nth(tl stringList, n - 1)


val stringList = [
    "medet", "can", "akus", "ericsson",
    "another","one", "bites", "the", "dust",
    "vscode", "msnbc", "ssst"
];

get_nth(stringList, 1);
get_nth(stringList, 2);
get_nth(stringList, 3);
get_nth(stringList, 4);
get_nth(stringList, 5);
get_nth(stringList, 11);
get_nth(stringList, 12);
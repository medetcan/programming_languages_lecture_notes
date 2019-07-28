datatype 'a option = NONE | SOME of 'a;
datatype 'a mylist = Empty | Cons of 'a * 'a mylist
datatype ('a, 'b) tree = Node of 'a * ('a, 'b) tree * ('a, 'b) tree
                       |Leaf of 'b;

fun sum_tree tr =
  case tr of
       Leaf i => i
     | Node (i, left, right) => i + (sum_tree left) + (sum_tree right);


fun sum_leaves tr =
  case tr of
      Leaf i => i
    | Node (i, left, right) => (sum_leaves left) + (sum_leaves right);


val my_tree = Node (2, Node(3, Leaf(1), Leaf(2)), Node(4, Leaf(1), Leaf(4)));

 sum_tree my_tree;

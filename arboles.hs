data Tree = Leaf Integer | Branch Integer Tree Tree

miniTree = (Branch 10 (Branch 5 (Leaf 10) (Leaf 5)) (Leaf 5))

addElements (Leaf x) = x
addElements (Branch x ri rd) = x + (addElements ri) + (addElements rd)
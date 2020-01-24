data Tree a = Leaf a
            | Branch (Tree a) (Tree a)
            deriving (Show)

treeMap :: (a -> b) -> (Tree a) -> (Tree b)
-- treeMap f (Leaf a) = Leaf (f a)
-- treeMap f (Branch l r) = Branch (treeMap f l) (treeMap f r)
treeMap f = g where
  g (Leaf a) = Leaf (f a)
  g (Branch l r) = Branch (g l) (g r)

treeFold :: (b -> b -> b) -> (a -> b) -> Tree a -> b
treeFold fb fl = g where
  g (Leaf a) = fl a
  g (Branch l r) = fb (g l) (g r)

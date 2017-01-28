# Invert Binary Tree

After reading [this tweet](https://twitter.com/mxcl/status/608682016205344768), I thought I'd actually suss out the question.

Invert this:

```
     4
   /   \
  2     7
 / \   / \
1   3 6   9
```

to
```
     4
   /   \
  7     2
 / \   / \
9   6 3   1
```

Solution:
```
var invertTree = function(root) {
    if (!root) {
        return null;
    }

    invertTree(root.left);
    invertTree(root.right);

    var temp = root.left;
    root.left = root.right;
    root.right = temp;
  
    return root;

};
```

The questions/test case can be found [here](https://leetcode.com/problems/invert-binary-tree/#).



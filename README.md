# Blocks

We're going to practice using blocks, implementing the Enumerable module so that
we can improve the readability and extensibility of our code.

We've provided an implementation of a [binary search tree](https://en.wikipedia.org/wiki/Binary_search_tree). We've implemented an `insert` method, that takes a `Node` object and automatically assigns it to the appropriate place in the tree.

### Setup and Running

```
bundle
ruby spec/binary_tree_spec.rb
```


### TODO

1. Read the code and see if you can follow how nodes are created and added. Notice the use of the [Comparable](https://ruby-doc.org/core-2.4.0/Comparable.html) module to allow us to compare `Node` objects using `>` and `<`.
2. Using the unit test provided as a guide, implement a `nodes` method, that returns all of the nodes in order. Keep running the unit test until that part of the test turns green.
3. Implement a `leaves` method, that returns just the nodes that are leaves; that is, without a `left` or `right` value.
4. Implement an `include?` method, that returns true if the tree contains the given node.
5. Implement a `find` method, that returns the first node matching the given data.
6. Implement a `delete` method, that deletes the first node matching the given data.

At this point, you will have the beginnings of a perfectly usable binary search tree. However, there will be by now quite a bit of repititon between some of your methods. In each case, we'll be navigating the tree, searching for nodes; but what we'll _do_ with each method will vary slightly. This is the purpose of using code blocks- we want to separate _how_ we step over the tree structure, from _what to do_ with each node we find.


# Blocks

## Install and Running

```
bundle
bundle exec ruby spec/binary_tree_spec.rb
```


## TODO

* Write a method `nodes` that returns all of the nodes in the tree, in alphabetical order.

`bundle exec ruby spec/binary_tree_spec.rb --name /"1. nodes"/`

* Write a method `leaves` that returns all of the nodes in the tree that have no children, in alphabetical order.

`bundle exec ruby spec/binary_tree_spec.rb --name /"2. leaves"/`

* Write a method `include?` that returns true if the given node exists anywhere in the tree

`bundle exec ruby spec/binary_tree_spec.rb --name /"3. include"/`

* Write a method `find` that takes a block, and returns the first node that matches the block

`bundle exec ruby spec/binary_tree_spec.rb --name /"4. find"/`

* Write a method `find_all` that takes a block, and returns all the nodes that match the block.

`bundle exec ruby spec/binary_tree_spec.rb --name /"5. find_all"/`

At this point, you might notice something about your methods. Are they at all similar? You might have found that you are even cut + pasting your code from method to method, since they all have something in common: you had to code _how_ to navigate around your tree; the only difference was _what_ you did differently each time.

### Enter Enumerable

Once we've established how to navigate over the tree, we can DRY up our code and avoid repetition by using the `Enumerable` module. Once we define an `each` method, we have access to all of the built-in methods we are accustomed to with arrays and hashes, such as `map`, `select`, `max`, `min` and so on, without having to reinvent the wheel and re-implement them.

1. Refactor your code so that you create an each method that steps over the nodes one at a time. Don't forget to pass each of the nodes to the block, so that each node is provided to the block.

2. Include the Enumerable module in your code: `include Enumerable`

3. See if you can comment out your methods and see if things still work! The `find`, `find_all` and `include?` methods should continue to work, whilst the node and leaves methods can be trivially implemented using `alias` and `select` respectively.




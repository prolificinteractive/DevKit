# Linked Lists

**Subspec: DataStructures/LinkedList**

### Description

A linked list is a linear collection of data elements where each element points to the next. A linked list has several theoretical advantages over contiguous storage options such as the Swift Array:

* Constant time insertion and removal from the front of the list.

* Reliable performance characteristics.

### Notes

Use a linked list over a Swift array if you need to store a large amount of data and you need to perform insertions and removals from any position in the sequence.

Do not use a linked list if you need indexing, sorting, random access to the data or sequence traversal from the back of the sequence to the front.

Warning: Due to the fact that each node has a reference to the next node, the memory footprint of a linked list can have a negative impact on the device if the list becomes extremely large.

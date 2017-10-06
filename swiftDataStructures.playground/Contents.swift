//: Playground - noun: a place where people can play

import UIKit

//LinkedList

final class LinkedList<T> {
    final class Node<T> {
        var next: Node<T>?
        var previous: Node<T>?
        var payload: T
        
        init(payload: T) {
            self.payload = payload
        }
    }
    
    var head: Node<T>?
    var tail: Node<T>?
    
    private(set) var count: Int = 0 //Can only be set privately, can still be called (get) externally
    
    func setHead(_ payload: T) -> Node<T> {
        let node = Node(payload: payload)
        
        /*
         The new defer keyword provides a safe and easy way to handle this challenge by declaring a block that will be executed only when execution leaves the current scope.
         
         http://nshipster.com/guard-and-defer/
         */
        
        defer {
            self.head = node
            count += 1
        }
        
        guard let head = head else {
            tail = node
            return node
        }
        
        head.previous = node
        
        node.previous = nil
        node.next = head
        
        return node
    }
    
    
}

//Binary Search Tree - from RayWanderlich
/*
 Note this implementation uses structs and enums which are value types:
     Average time complexity for a binary search tree for the traditional implementation using classes is
     O(log n), which is considerably faster. Using classes (reference semantics) won't have the copy-on
     write behaviour, so you'll be able to insert without making a complete copy of the tree.
 */
//Binary Tree implementation
class Node<T> {
    var value: T
    var leftChild: Node?
    var rightChild: Node?
    
    init(_ value: T) {
        self.value = value
    }
}

//indirect allows value types to be interpreted as reference types so recursive calls can take place
enum BinaryTree<T: Comparable> {
    case empty
    indirect case node(BinaryTree, T, BinaryTree)
    
    var count: Int {
        switch self {
        case let .node(left, _, right):
            return left.count + 1 + right.count
        case .empty:
            return 0
        }
    }
    
    //This code will not work since everytime the tree is changed it'll just create a new copy
    mutating func naiveInsert(newValue: T) {
        //It can see these? In scope?
            //I guess that the tree is set to this node, if not it'll initialize a root node with no right or left subtrees
        guard case .node(var left, let value, var right) = self else {
            self = .node(.empty, newValue, .empty)
            return
        }
        
        //Recursive calls to check left and right tree respectively
        if newValue < value {
            left.naiveInsert(newValue: newValue)
        } else {
            right.naiveInsert(newValue: newValue)
        }
    }
    
    mutating func insert(newValue: T) {
        self = newTreeWithInsertedValue(newValue: newValue)
    }
    
    private func newTreeWithInsertedValue(newValue: T) -> BinaryTree {
        switch self {
        case .empty:
            return .node(.empty, newValue, .empty)
        case let .node(left, value, right):
            if newValue < value {
                return .node(left.newTreeWithInsertedValue(newValue: newValue), value, right)
            } else {
                return .node(left, value, right.newTreeWithInsertedValue(newValue: newValue))
            }
        }
    }
    
    func traverseInOrder(process: (T) -> ()) {
        switch self {
        case .empty:
            return
        case let .node(left, value, right):
            left.traverseInOrder(process: process)
            process(value)
            right.traverseInOrder(process: process)
        }
    }
}

//Specify custom output
extension BinaryTree: CustomStringConvertible {
    var description: String {
        switch self {
        case let .node(left, value, right):
            return
                "value: \(value), left = [" + left.description +
                "], right = [" + right.description + "]"
        case .empty:
            return ""
        }
    }
}

//leafs
let node5 = BinaryTree.node(.empty, "5", .empty)
let nodeA = BinaryTree.node(.empty, "a", .empty)
let node10 = BinaryTree.node(.empty, "10", .empty)
let node4 = BinaryTree.node(.empty, "4", .empty)
let node3 = BinaryTree.node(.empty, "3", .empty)
let nodeB = BinaryTree.node(.empty, "b", .empty)

//setting left tree
    //right subtree in left tree
    let aMinus10 = BinaryTree.node(nodeA, "-", node10)
//set root left tree, right is aforementioned tree
let timesLeft = BinaryTree.node(node5, "*", aMinus10)

//setting right tree
let minus4 = BinaryTree.node(.empty, "-", node4)
    //right subtree in right tree
    let divide3andB = BinaryTree.node(node3, "/", nodeB)
//root node in right subtree
let timesRight = BinaryTree.node(minus4, "*", divide3andB)

//root node
//let tree = BinaryTree.node(timesLeft, "+", timesRight)

//print(tree.count)

/*
var binaryTree: BinaryTree<Int> = .empty
binaryTree.insert(newValue: 5)
binaryTree.insert(newValue: 7)
binaryTree.insert(newValue: 9)
*/
//print(binaryTree)

var tree: BinaryTree<Int> = .empty
tree.insert(newValue: 7)
tree.insert(newValue: 10)
tree.insert(newValue: 2)
tree.insert(newValue: 1)
tree.insert(newValue: 5)
tree.insert(newValue: 9)

tree.traverseInOrder { print($0) }

final class BinarySearchTreeRef<T> {
    
    var root: Node?
    
    final class Node<T> {
        var left: Node?
        var right: Node?
        var data: T
        
        init (_ data: T) {
            self.data = data
        }
    }
    
    func lookup(value: T) -> Node {
        
    }
    
    func insert(value: T) -> BinarySearchTreeRef {
        if self.root.data == nil {
            return
        }
        
        return BinarySearchTreeRef()
    }
}

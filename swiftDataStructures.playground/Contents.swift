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
enum BinaryTree<T> {
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
let tree = BinaryTree.node(timesLeft, "+", timesRight)

print(tree.count)


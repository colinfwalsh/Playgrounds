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

class Node<T> {
    var value: T
    var leftChild: Node?
    var rightChild: Node?
    
    init(_ value: T) {
        self.value = value
    }
}



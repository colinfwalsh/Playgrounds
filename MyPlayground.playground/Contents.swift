//: Playground - noun: a place where people can play

import UIKit


final class DoublyLinkedList<T> {
    final class Node<T> {
        var next: Node<T>?
        var previous: Node<T>?
        var data: T?
        
        init(_ data: T) {
            self.data = data
        }
    }
    
    func makeFrontWithData(_ data: T) -> Node<T> {
        return Node.init(T)
    }
}



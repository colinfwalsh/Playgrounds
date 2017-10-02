//: Playground - noun: a place where people can play

import UIKit

final class LinkedList<T> {
    final class Node<T> {
        var next: Node<T>?
        var payload: T
        
        init(_ payload: T) {
            self.payload = payload
        }
    }
}

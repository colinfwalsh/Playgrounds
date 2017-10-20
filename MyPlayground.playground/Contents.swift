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


func fizzBuzz(int: Int) {
    for i in 1...int {
            i % 3 == 0 &&
            i % 5 == 0 ? print("FizzBuzz") :
            i % 3 == 0 ? print("Fizz") :
            i % 5 == 0 ? print("Buzz") :
            print(i)
        /*
        if (i % 3 == 0 && i % 5 == 0) {
            print("FizzBuzz")
        } else if (i % 3 == 0) {
            print("Fizz")
        } else if (i % 5 == 0) {
            print("Buzz")
        } else {
            print(i)
        }*/
    }
}

fizzBuzz(int: 1000)


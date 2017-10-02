//: Playground - noun: a place where people can play

import UIKit

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


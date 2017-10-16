//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//Mutability in Swift

//let constants CANNOT be changed after definition
    //Immutable
/*
let constant = 0
constant = 1
*/

//var constants can be changed after definition
    //Mutable

var constant = 0
constant = 1

//Optional Type
//Swift is big on a special type called Optionals
//Optionals are one of the main ways Swift handles nil values
// You can think of Optionals as sort of a Schroedingers Cat of a specific type
// Optionals should always be treated as if the value is nil, in order to have complete coverage of the app
// Furthermore, optionals must be unwrapped BEFORE using the underlying type.  There are multiple ways of doing this

let stringOptional: String? = nil

//Unsafe unwrap
//print(stringOptional!) //This forces the compiler to unwrap the optional regardless of the value, there are very few reasons to
                        //do something like this.  Only force unwrap when you're 100% positive the value you are unwrapping is not nil

//Another way of handling unwraps is through something called "Optional Chaining" essentially it looks similar to using an if statement to handle
//a nil in most other languages
    // While swift uses a typical if/else logic statement to handle nils, there is a little bit more to this block.  For one, there is a new value defined in order to capture the unwrapped value, but it's limited to the scope of the code inside the if statement.  This is very important to consider going forward, since in most cases you want to use the unwrapped value outside of the scope of this block

if let string = stringOptional {
    print(string)
} else {
    print("Value is nil")
}

//Better way of handling optional values
//Many times you'll find optional chaining to be a bit cumbersome in your applications, and you want to access an optional value in scope
// to do this, you'll use something called a "Nil Coalescing Operator"

let string = stringOptional ?? "Nil"

print(string)

//Pass by Value vs. Pass by Reference
    //Nearly everything in Swift is a value type if it's a default type
    //Furthermore any struct is a value type
    //Classes are reference types, thus use a class if you're concerned about mutable state, otherwise use value types
    //It's considered more "Swifty" if you use structs over classes as (apparently) they have a lower affect on memory resources, although
    //the benefit is marginal
//Value types

let num1 = 90
var num2 = num1

num2 = 110

//Reference type

class Cat: NSObject {
    var furColor = "Black"
    var name = "Combo"
}

let defaultCat = Cat()
let otherCat = defaultCat
otherCat.name = "Mittens"

print(defaultCat.name)

struct CatVal {
    var furColor = "Black"
    var name = "Combo"
}


let structCat = CatVal()
var newCat = structCat

newCat.name = "Mittens"
print(structCat.name)

//For loops

//Loops are not in the C-Style for(int i = 0; i < array.count; i++) rather look more like python (imperitive) for i in array

let array = [1, 2, 3, 4, 5]

for i in array {
    print(i)
}

//While loop - pretty much exactly what you'd expect

var i = 0

while i < array.count {
    print(array[i])
    i += 1 //increment operator
}


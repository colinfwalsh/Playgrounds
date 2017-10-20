/*:

 # Intro to Swift
 
 ## Mutability
 
 Mutability is a relatively simple concept, but one that must be understood in order for you to succeed with Swift. *Immutable* means a constant *cannot* be changed, while *mutable* means a variable can be altered.  Think of it as mutation - one can mutate the other cannot.  The keyword *let* means the value is immutable while *var* means it is mutable.

         var variable = 0
         variable = 1 // Can change - no error
 
         let constant = 0
         constant = 1 // Cannot change - error
 ## Loops
 
 ### For Loop
 For loops are not in the C-Style for(int i = 0; i < array.count; i++) rather look more like python (imperitive) for i in array
 
     let array = [1, 2, 3, 4, 5]
 
     for i in array {
         print(i)
     }
 
 ### While loop
 
 Standard while loop.
 
     var i = 0
 
     while i < array.count {
         print(array[i])
         i += 1 //increment
     }
 
 ### Repeat While
 
 Similar to a do-while loop in other langauges.
 
     var i = 0
 
     repeat {
         print(array[i])
         i += 1
     } while i < array.count
 
 ## Optional Type
One of the hallmarks of the Swift language is the special way it handles nil values.  They are a special type that you will most definitely run into a bunch.  It's super important to understand these special instances.
 
 You can think of Optionals as sort of a Schroedingers Cat of a specific type Optionals should always be treated as if the value is nil, in order to have complete coverage of the app.  Furthermore, optionals must be unwrapped BEFORE using the underlying type.  There are multiple ways of doing this:

         let stringOptional: String? = nil
 
 Above we defined a constant called *stringOptional* that is of type Optional<String>.  How do you know this?  The question mark at the end tells you the answer.  The question mark is shorthand for Optional<T> (if you're not sure how to read this, we'll cover generics a bit later).  Furthermore, we set the value to nil to explore how we'd handle a constant like this.

 ### Unsafe unwrap
 
 This forces the compiler to unwrap the optional regardless of the value, while this is available to you **there are very few reasons to do something like this**.  Only force unwrap when you're 100% positive the value you are unwrapping is not nil.
 
         print(stringOptional!) // Will throw an error
 
         let someValue: String? = "Hello"
         print(someValue!) // Will print Hello

 ### Optional Chaining
 
 Another way of handling unwraps is through something called "Optional Chaining" essentially it looks similar to using an if statement to handle a nil in most other languages.  While swift uses a typical if/else logic statement to handle nils, there is a little bit more to this block. For one, there is a new value defined in order to capture the unwrapped value, but it's limited to the scope of the code inside the if statement.  This is very important to consider going forward, since in most cases you want to use the unwrapped value outside of the scope of this block.  However, there are a few ways of doing this.

     if let string = stringOptional {
        print(string)
     } else {
        print("Value is nil") //Should print nil
     }

 ### Nil Coalescing Operator
 
 Many times you'll find optional chaining to be a bit cumbersome in your applications, and you want to access an optional value in scope to do this, you'll use something called a "Nil Coalescing Operator"
 
     let defaultString = "Default case"
     let string = stringOptional ?? defaultString
 
     print(string) //Should print Default case
 
 It's worth pointing out the similarities between this operator and a terinary operator in most other langauges.  In fact, that's pretty much all this is.  ?? is exactly the same as:
 
     stringOptional != nil ? stringOptional : defaultString

 ## Pass by Value vs. Pass by Reference
 
Nearly everything in Swift is a value type if it's a default type.  Furthermore any struct is a value type.  Classes are reference types, thus use a class if you're concerned about mutable state, otherwise use value typee.  It's considered more "Swifty" if you use structs over classes as (apparently) they have a lower affect on memory resources, although the benefit is marginal.
 
 ### Value Types
 
     You'll notice in this example how value types retain their values even when called by other constants.
 
     struct Cat {
         var furColor = "Black"
         var name = "Combo"
     }
 
     let cat1 = Cat()
     let cat2 = cat1
 
     cat2.name = "Mittens"
 
     print(cat1.name) // Will print Combo since cat2 got a copy of cat1, not a reference to it (pass by value)
 
 ### Reference Types
 
     You'll notice here that these work the same as most other OOL in that multiple constants/variables can reference back to a single instance.
 
     class Cat {
         var furColor = "Black"
         var name = "Combo"
     }
 
     let cat1 = Cat()
     let cat2 = cat1
 
     cat2.name = "Mittens"
 
     print(cat1.name) // Will print Mittens
 */



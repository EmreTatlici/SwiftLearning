import Foundation

// Defining two constant variables holding strings
let myName = "Vandad"
let yourName = "Foo"

// Creating an array of names using the constants
var names =  [
    myName,
    yourName
]

// Appending two new names to the 'names' array
names.append("Bar")
names.append("Baz")

// Demonstrating how to change values of variables
let foo = "Foo"  // A constant string
var foo2 = foo   // A variable assigned the value of 'foo'

foo2 = "Foo 2"   // Changing the value of 'foo2'

// 'foo' remains the same, but 'foo2' has changed
foo   // This will print "Foo"
foo2  // This will print "Foo 2"

// Demonstrating array copy behavior
let moreNames = [
    "Foo",
    "Bar"
]
var copy = moreNames  // Copying the array
copy.append("Baz")    // Adding an item to the copy

// The original 'moreNames' array doesn't change, only the 'copy' array does
moreNames  // This will print ["Foo", "Bar"]
copy       // This will print ["Foo", "Bar", "Baz"]

// Working with NSMutableArray (mutable array type)
let oldArray = NSMutableArray(
    array: [
        "Foo",
        "Bar"
    ]
)

oldArray.add("Baz")  // Adding "Baz" to the array
var newArray = oldArray  // Assigning 'oldArray' to 'newArray'
newArray.add("Qux")  // Adding "Qux" to 'newArray'

// Both 'oldArray' and 'newArray' are referencing the same array, so changes to one will affect the other
oldArray  // This will print ["Foo", "Bar", "Baz", "Qux"]
newArray  // This will print ["Foo", "Bar", "Baz", "Qux"]

// Demonstrating how NSMutableArray can be modified inside a function
let someNames = NSMutableArray(
    array: [
        "Foo",
        "Bar"
    ]
)

// This line would throw an error because we cannot reassign a constant:
// someNames = "Baz"  // Error: cannot assign to value of type 'NSMutableArray'

// The function modifies the array, but we are passing a mutable array
func changeTheArray(_ array: NSArray) {
    let copy = array as! NSMutableArray  // Casting the array to NSMutableArray for modification
    copy.add("Baz")  // Adding "Baz" to the array
}

// Calling the function
changeTheArray(someNames)  // The array inside the function is modified

// The change affects 'someNames' because it's a reference type (NSMutableArray)
someNames  // This will print ["Foo", "Bar", "Baz"]

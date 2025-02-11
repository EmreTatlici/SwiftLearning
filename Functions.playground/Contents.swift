import Foundation

// Function with no arguments and no return value
func noArgumentsAndNoReturnValue() {
    "I don't know what I'm doing" // This is a statement, but it's not used or returned
}

noArgumentsAndNoReturnValue() // Calling the function; the result isn't used


// Function that accepts an integer and adds 2 to it, but doesn't return anything
func plusTwo(value: Int) {
    let newValue = value + 2 // This calculation is done, but the result isn't used or returned
}
plusTwo(value: 3) // Calling the function with 3, but the result is not used


// Function that returns the input value plus 2
func newPlusTwo(value: Int) -> Int {
    return value + 2 // The result is returned to the caller
}

plusTwo(value: 3) // Calling `plusTwo` but no result is captured
newPlusTwo(value: 5) // The result (7) can be captured or used


// A custom addition function that takes two integer parameters and returns their sum
func customAdd(
    value1: Int,
    value2: Int
) -> Int {
    value1 + value2 // Implicit return
}

let customAdded = customAdd(value1: 10, value2: 20) // This will be 30


// Custom subtraction function with an underscore (_) for parameter names
// Using _ makes the function call syntax cleaner by not requiring parameter labels
func customMinus(
    _ lhs: Int, // First parameter without a label
    _ rhs: Int // Second parameter without a label
) -> Int {
    lhs - rhs // Return the result of lhs minus rhs
}

let customSubtracted = customMinus(20, 10) // This will be 10


// Function call without capturing return value
customAdd(value1: 20, value2: 30) // 50 will be returned but not used


// Using @discardableResult allows the caller to ignore the result without warnings
@discardableResult
func myCustomAdd(
    _ lhs: Int,
    _ rhs: Int
) -> Int {
    lhs + rhs
}

myCustomAdd(
    20,
    30
) // This will return 50, but no value is captured or used


// Function with default parameter values
// If no argument is passed, it uses the default values
func getFullName(
    firstName: String = "Foo",
    lastName: String = "Bar"
) -> String {
    "\(firstName) \(lastName)" // Concatenates the first and last name
}

getFullName() // Default values ("Foo", "Bar") are used
getFullName(firstName: "Baz") // Uses "Baz" for firstName, "Bar" remains as default
getFullName(lastName: "NotBar") // Uses "Foo" for firstName, "NotBar" for lastName
getFullName(firstName: "Baz", lastName: "NotBar") // Both values are passed and used

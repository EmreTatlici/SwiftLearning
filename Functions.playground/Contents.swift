import Foundation

func noArgumentsAndNoReturnValue() {
    "I don't know what I'm doing"
}

noArgumentsAndNoReturnValue()


func plusTwo(value: Int) {
    let newValue = value + 2
}
plusTwo(value: 3)

func newPlusTwo(value: Int) -> Int {
    return value + 2
}

plusTwo(value: 3)
newPlusTwo(value: 5)


func customAdd(
    value1: Int,
    value2: Int
) -> Int {
    value1 + value2
}

let customAdded = customAdd(value1: 10, value2: 20)

func customMinus(
    _ lhs: Int, // when you call functions you don't write lhs, rhs when you use _
    _ rhs: Int
) -> Int {
    lhs - rhs
}

let customSubtracted = customMinus(20, 10)


customAdd(value1: 20, value2: 30)

@discardableResult // unused error can be prevented by discardableResult
func myCustomAdd(
    _ lhs: Int,
    _ rhs: Int
) -> Int {
    lhs + rhs
}
myCustomAdd(
    20,
    30
)

func getFullName(
    firstName: String = "Foo",
    lastName: String = "Bar"
) -> String {
    "\(firstName) \(lastName)"
}
getFullName()
getFullName(firstName: "Baz")
getFullName(lastName: "NotBar")
getFullName(firstName: "Baz", lastName: "NotBar")

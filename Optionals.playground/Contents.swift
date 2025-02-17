import Foundation

// Optionals may not exist!



// this way, you have to give a function a number
func multiplyByTwo(_ value: Int) -> Int {
    value * 2
}


multiplyByTwo(3)



func multiplyByTwoOptional(_ value: Int? = nil) -> Int {
    if let value {
        return value * 2
    } else {
        return 0
    }
}

multiplyByTwoOptional()
multiplyByTwoOptional(2)


let age: Int? = nil
if age != nil {
    "Age is there! How odd!"
} else {
    "Age is nil. Correct."
}

if let age {
    "Age is there. How odd! Its value is \(age)"
} else {
    "No age is present. As expected."
}





// GUARD

func checkAge() {
    guard age != nil else { // age should not be nil, else do this.
        "Age is nil as expected"
        return
    }
    
    
    "Age is not nil here. Strange!"
}

checkAge()

let age2: Int? = 0 // this variable has to be optional for "guard" to use.
func checkAge2() {
    guard let age2 else {
        "Age2 is nil. How strange."
        return
    }
    "Age2 is not nil as expected."
}

checkAge2()


switch age {
case .none:
    "Age has no value as expected."
    break
case let .some(value):
    "Age has the value of \(value)"
    break
}


let age3 = 0
if age3 == 0 {
    "Age2 is 0 as expected"
} else {
    "Age3 is not 0. How strange!"
}


struct Person {
    let name: String
    let address: Address?
    struct Address {
        let firstLine: String? // might no exist.
        
    }
}

let foo: Person = Person(name: "Foo", address: nil)

if let fooFirstAddressLine = foo.address?.firstLine { // if address exist, get the firstLine
    fooFirstAddressLine
} else {
    "Foo doesn't have an address with first line as expected."
}
    

if let fooAddress = foo.address, let firstLine = fooAddress.firstLine {
    // If `foo.address` is not nil, assign it to `fooAddress`
    // If `fooAddress.firstLine` is not nil, assign it to `firstLine`
    fooAddress // `fooAddress` now holds the unwrapped `foo.address`
    firstLine  // `firstLine` now holds the unwrapped `fooAddress.firstLine`
}






let bar: Person? = Person(name: "Bar", address: Person.Address(firstLine: nil))
// `bar` is an optional Person (`Person?`), meaning it can be `nil` or contain a `Person` instance.
// Right now, `bar` holds a `Person` object with the name "Bar" and an address.

// The `Person` instance has an `address`, but `firstLine` inside the address is `nil`.
// This means the person has an address, but the first line of the address is unknown.
if bar?.name == "Bar", bar?.address?.firstLine == nil {
    "Bar's name is bar and has no first line of addrress"
} else {
    "Seems like something isn't working right!"
}


let baz: Person? = Person(name: "Baz", address: Person.Address(firstLine: "Baz first line"))
switch baz?.address?.firstLine { // if the person "baz" exists and he/she has address, get firstLine
case let .some(firstLine) where firstLine.starts(with: "Baz"):
    "Baz first address line = \(firstLine)"
// if previous case does not happen
case let .some(firstLine):
    "Baz first address line that didn't match the previoud case" // if firstLine does not start with "Baz"
    firstLine
// if none of the .some cases occur, this .none case works.
case .none:
    "Baz first address line is nil? Weird!"
}


func getFullName(
    firstName: String,
    lastName: String?
) -> String? {
    if let lastName {
        return "\(firstName) \(lastName)"
    } else {
        return nil
    }
}

getFullName(firstName: "Foo", lastName: nil) // if lastName is null, return nil, else return first & lastName
getFullName(firstName: "Foo", lastName: "Bar")


func getFullName2(
    firstName: String,
    lastName: String?
) -> String? {
    guard let lastName else {
        return nil
    }
    return "\(firstName) \(lastName)"
}

getFullName2(firstName: "Foo", lastName: nil) 
getFullName2(firstName: "Foo", lastName: "Bar")

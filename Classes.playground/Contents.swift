import Foundation

// Classes are reference types, meaning when we assign a class instance to another variable, they point to the same memory.
class Person {
    var name: String
    var age: Int
    
    init(
        name: String,
        age: Int
    ) {
        self.name = name
        self.age = age
    }
    
    // Method to increase age
    func increaseAge() {
        self.age += 1
    }
}

// Creating an instance of the Person class
let foo = Person(name: "Foo", age: 20)

foo.age  // Accessing the age of the person
foo.increaseAge()  // Increasing age by 1
foo.age  // Checking the new age

// Assigning the reference of 'foo' to 'bar'. Both variables point to the same object in memory.
let bar = foo
bar.increaseAge()  // Changing age through 'bar' also affects 'foo'
foo.age  // Age of 'foo' has changed
bar.age  // Age of 'bar' has changed

// Comparing if 'foo' and 'bar' are the same object in memory
if foo === bar { 
    "Foo and Bar point to the same memory"  // True, since they are the same object
} else {
    "They don't point to the same memory"
}

class Vehicle {
    // Vehicle class with a method
    func goVroom() {
        "Vroom vroom"
    }
}

class Car: Vehicle {
    // Car class inherits from Vehicle
}

let car = Car()
car.goVroom()  // Calling the method from the Vehicle class

// A class with a private setter, age can only be modified internally
class Person2 {
    private(set) var age: Int // age can only be internally changed
    init(age: Int) {
        self.age = age
    }
    func increaseAge() {
        self.age += 1
    }
}

let baz = Person2(age: 20)
baz.age  // Accessing the age
baz.increaseAge()  // Increasing age by 1
baz.age  // Checking the new age
//baz.age += 1  // This line would give an error because of the private(set) modifier

// Tesla class with two types of initializers
class Tesla {
    let manufacturer = "Tesla"
    let model: String
    let year: Int
    
    // Designated initializer
    init() {
        self.model = "X"  // Default model is "X", year is 2023
        self.year = 2023
    }
    
    // Custom designated initializer
    init(
        model: String,
        year: Int
    ) {
        self.model = model
        self.year = year
    }
    
    // Convenience initializer, calls the designated initializer
    convenience init(
        model: String
    ) {
        self.init(
            model: model,
            year: 2023
        )
    }
}

// TeslaModelY subclass
class TeslaModelY: Tesla {
    override init() {
        super.init(
            model: "Y",
            year: 2023
        )
    }
}

// Creating an instance of TeslaModelY
let modelY = TeslaModelY()
modelY.model  // Accessing the model of TeslaModelY
modelY.year  // Accessing the year of TeslaModelY
modelY.manufacturer  // Accessing the manufacturer of Tesla

// Creating an instance of Person2 and passing it to a function
let fooBar = Person2(age: 20)
fooBar.age  // Initial age

// Function that works with a Person2 instance
func doSomething(with person: Person2) {
    person.increaseAge()  // Calls the increaseAge method
}
doSomething(with: fooBar)  // Increases the age
fooBar.age  // Checking the new age

// Class with a deinit method to demonstrate object deallocation
class MyClass {
    init() {
        "Initialized"
    }
    
    func doSomething() {
        // empty method
    }
    
    deinit {
        "Deinitialized"  // This will be called when the object is deallocated
    }
}

// Creating and calling a closure
let myClosure = {
    let myClass = MyClass()  // Creating an instance of MyClass
    myClass.doSomething()  // Calling a method
}
myClosure()  // Executing the closure, which initializes and deinitializes MyClass instance

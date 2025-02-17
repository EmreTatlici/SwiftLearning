import Foundation

// Classes are like structures. but not value types, they are reference types, and allow for mutability.

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
    
    func increaseAge() {
        self.age += 1
    }
}

let foo = Person(name: "Foo", age: 20)

foo.age
foo.increaseAge()
foo.age



let bar = foo // they connect between, when bar increase age, foo does also.
bar.increaseAge()
foo.age
bar.age


if foo === bar { // === tests if two class variables equal, not to do that use Equatable in Class, we are going to learn that.
    "Foo and Bar point to the same memory"
} else {
    "They don't point to the same memory"
}


class Vehicle {
    func goVroom() {
        "Vroom vroom"
    }
}

class Car: Vehicle {
    
}

let car = Car()
car.goVroom()

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
baz.age
baz.increaseAge()
baz.age
//baz.age += 1 // bc of the private(set)

class Tesla {
    let manufacturer = "Tesla"
    let model: String
    let year: Int
    
    init() {
        self.model = "X" // model and year will be "X" and 2023, when people don't give value it. It's called Designeated Initializer.
        self.year = 2023
    }
    init(
        model: String,
        year: Int
    ) {
        self.model = model
        self.year = year
    }
    
    convenience init(
        model: String
    ) {
        self.init(
            model: model,
            year: 2023
    )
    }
}


class TeslaModelY: Tesla {
    override init() {
        super.init(
            model: "Y",
            year: 2023
        )
    }
}

let modelY = TeslaModelY()
modelY.model
modelY.year
modelY.manufacturer

let fooBar = Person2(age: 20)
fooBar.age
func doSomething(with person: Person2) {
    person.increaseAge()
}
doSomething(with: fooBar)
fooBar.age



class MyClass {
    init() {
        "Initialized"
    }
    func doSomething() {
        // empty
    }
    deinit {
        "Deinitialized"
    }
}

let myClosure = {
    let myClass = MyClass()
    myClass.doSomething()
}
myClosure()

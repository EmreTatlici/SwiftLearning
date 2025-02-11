import Foundation

// Defining a structure named `Person` that represents a person's name and age.
struct Person {
    let name: String  // A constant property to store the person's name
    let age: Int      // A constant property to store the person's age
}

// Creating an instance of `Person`
let foo = Person(
    name: "Foo",
    age: 20
)

// Accessing properties of the `Person` instance
foo.name  // Returns "Foo"
foo.age   // Returns 20


// Defining a structure `CommodoreComputer` to represent a computer model.
struct CommodoreComputer {
    let name: String          // The name of the computer model
    let manufacturer: String  // A constant manufacturer name

    // Custom initializer that automatically sets the manufacturer
    init(name: String) {
        self.name = name
        self.manufacturer = "Commodore"  // Manufacturer is always "Commodore"
    }
}

// Creating an instance of `CommodoreComputer`
let c64 = CommodoreComputer(name: "C64")

// Accessing properties
c64.name          // Returns "C64"
c64.manufacturer  // Returns "Commodore"


// A `Person2` struct that includes first and last names along with a computed property
struct Person2 {
    let firstName: String
    let lastName: String
    
    // Computed property that generates the full name dynamically
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}

// Creating an instance of `Person2`
let fooBar = Person2(firstName: "Foo", lastName: "Bar")

// Accessing the computed property
fooBar.fullName  // Returns "Foo Bar"


// A `Car` struct with a mutable method
struct Car {
    var currentSpeed: Int  // The current speed of the car
    
    // Mutating function that updates the car's speed
    mutating func drive(speed: Int) {
        "Driving..."
        currentSpeed = speed
    }
}

// Creating an immutable car (constant)
let immutableCar = Car(currentSpeed: 10)
// immutableCar.drive(speed: 20) // This will cause an error because `immutableCar` is constant

// Creating a mutable car (variable)
var mutableCar = Car(currentSpeed: 10)
mutableCar.drive(speed: 20)  // Updates speed to 20

// Creating a copy of `mutableCar`
let copy = mutableCar  // `copy` is independent of `mutableCar`
mutableCar.drive(speed: 30)  // Updates `mutableCar` speed to 30

// Checking speed values of original and copied instances
mutableCar.currentSpeed  // Returns 30
copy.currentSpeed        // Returns 20 (unchanged, proving struct copies are independent)


// A base struct `LivingThing` that prints a message when initialized
struct LivingThing {
    init() {
        "I'm a living thing"
    }
}

// Structs in Swift do not support inheritance, so the following would cause an error:
// struct Animal: LivingThing { }


// Defining a `Bike` struct
struct Bike {
    let manufacturer: String  // The name of the bike manufacturer
    let currentSpeed: Int     // The current speed of the bike
    
    // A function that returns a new `Bike` instance with a modified speed
    func copy(currentSpeed: Int) -> Bike {
        Bike(manufacturer: self.manufacturer, currentSpeed: currentSpeed)
    }
}

// Creating an instance of `Bike`
let bike1 = Bike(manufacturer: "HD", currentSpeed: 20)

// Copying `bike1` and modifying the speed in the new instance
var bike2 = bike1.copy(currentSpeed: 30)

// Checking speeds of both bikes
bike1.currentSpeed  // Returns 20 (original remains unchanged)
bike2.currentSpeed  // Returns 30 (new instance with modified speed)

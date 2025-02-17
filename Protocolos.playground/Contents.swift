import Foundation

// Protocol to define breathing behavior
protocol CanBreathe {
    func breathe()
}

// Animal struct conforms to CanBreathe protocol and implements breathe method
struct Animal: CanBreathe {
    func breathe() {
        "Animal breathing..."  // Implementation of breathe for Animal
    }
}

// Person struct also conforms to CanBreathe protocol and implements breathe method
struct Person: CanBreathe {
    func breathe() {
        "Person breathing..."  // Implementation of breathe for Person
    }
}

// Creating instances of Animal and Person and calling their breathe methods
let dog = Animal()
dog.breathe()  // "Animal breathing..."
let foo = Person()
foo.breathe()  // "Person breathing..."

// Protocol CanJump does not have a body for the methods
protocol CanJump {
    func jump()
}

// Extension to provide default behavior for jump
extension CanJump {
    func jump() {
        "Jumping..."  // Default behavior for jump
    }
}

// Cat struct conforms to CanJump protocol and inherits the default jump behavior
struct Cat: CanJump {
    
}

// Creating an instance of Cat and calling its jump method
let whiskers = Cat()
whiskers.jump()  // "Jumping..."

// Protocol HasName defines properties and methods related to names and age
protocol HasName {
    var name: String { get }
    var age: Int { get set }
    mutating func increaseAge()
}

// Default implementation of describeMe and increaseAge methods in extension
extension HasName {
    func describeMe() -> String {
        "Your name is \(name) and you are \(age) years old"
    }
    
    mutating func increaseAge() {
        self.age += 1  // Default increaseAge implementation
    }
}

// Dog struct conforms to HasName protocol and provides its own properties
struct Dog: HasName {
    var name: String
    var age: Int
}

// Creating an instance of Dog and interacting with its properties and methods
var woof = Dog(name: "Woof", age: 10)
woof.name  // Accessing the name property
woof.age   // Accessing the age property
woof.age += 1  // Modifying the age
woof.age   // Checking the new age
woof.describeMe()  // Describing the dog
woof.increaseAge()  // Increasing the age using the protocol's method
woof.age   // Checking the updated age

// Vehicle protocol defines properties and methods related to vehicles
protocol Vehicle {
    var speed: Int { get set }
    mutating func increaseSpeed(by value: Int)
}

// Default implementation for increaseSpeed method in extension
extension Vehicle {
    mutating func increaseSpeed(by value: Int) {
        self.speed += value  // Default behavior to increase speed
    }
}

// Bike struct conforms to Vehicle protocol and provides its own speed property
struct Bike: Vehicle {
    var speed: Int
    init() {
        self.speed = 0  // Initializing speed to 0
    }
}

// Creating an instance of Bike and calling its methods
var bike = Bike()
bike.speed  // Checking the initial speed
bike.increaseSpeed(by: 10)  // Increasing the speed by 10
bike.speed  // Checking the updated speed

// Function to check if an object conforms to the Vehicle protocol
func describe(obj: Any) -> String {
    if obj is Vehicle {
        "Obj conforms to the Vehicle protocol"  // If the object conforms to Vehicle
    } else {
        "Obj does not conform to the Vehicle protocol"  // If the object does not conform
    }
}
describe(obj: bike)  // Calling the function with the bike object

// Function to increase speed if the object is of type Vehicle
func increaseSpeedIfVehicle(
    obj: Any
) {
    if var vehicle = obj as? Vehicle {  // Trying to cast the object to Vehicle
        vehicle.speed  // Accessing speed
        vehicle.increaseSpeed(by: 10)  // Increasing speed by 10
        vehicle.speed  // Checking the new speed
    } else {
        "This was not a vehicle"  // If the object is not a vehicle
    }
}
increaseSpeedIfVehicle(obj: bike)  // Calling the function with the bike object
bike.speed  // Checking the speed of bike after trying to increase speed

// Explanation of behavior: when using struct, any change to its value does not persist because structs are value types, 
// while classes are reference types and changes will persist for class instances.

import Foundation

protocol CanBreathe {
    func breathe()
}


struct Animal: CanBreathe {
    func breathe() {
        "Animal breathing..."
    }
    
}

struct Person: CanBreathe {
    func breathe() {
        "Person breathing..."
    }
}

let dog = Animal()
dog.breathe()
let foo = Person()
foo.breathe()


// Protocol methods does not allow body
protocol CanJump {
    func jump()
}

extension CanJump {
    func jump() {
        "Jumping..."
    }
}

struct Cat: CanJump {
    
}

let whiskers = Cat()
whiskers.jump()


protocol HasName {
    var name: String { get }
    var age: Int { get set }
    mutating func increaseAge()
}

extension HasName {
    func describeMe() -> String {
        "Your name is \(name) and yyou are \(age) years old"
    }
    mutating func increaseAge() {
        self.age += 1
    }
}


struct Dog: HasName {
    var name: String
    var age: Int
}

var woof = Dog(name: "Woof", age: 10)
woof.name
woof.age
woof.age += 1
woof.age
woof.describeMe()
woof.increaseAge()
woof.age


protocol Vehicle {
    var speed: Int { get set }
    mutating func increaseSpeed(by value: Int)
}

extension Vehicle {
    mutating func increaseSpeed(by value: Int) {
        self.speed += value
    }
}
struct Bike: Vehicle {
    var speed: Int
    init() {
        self.speed = 0
    }
}

var bike = Bike()
bike.speed
bike.increaseSpeed(by: 10)
bike.speed


func describe(obj: Any) -> String {
    if obj is Vehicle {
        "Obj conforms to the Vehicle protocol"
    } else {
        "Obj does not conform to the Vehicle protocol"
    }
}
describe(obj: bike)

/// as?



func increaseSpeedIfVehicle(
    obj: Any
) {
    if var vehicle = obj as? Vehicle { // We are trying to cast obj to the Vehicle type. If successful, it's assigned to the variable vehicle.
        vehicle.speed
        vehicle.increaseSpeed(by: 10)
        vehicle.speed
    } else {
        "This was not a vehicle"
    }
}
increaseSpeedIfVehicle(obj: bike)
bike.speed // when you use struct and change the value of it, it does not save that to memory, but Class does.




















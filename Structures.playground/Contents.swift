import Foundation

struct Person {
    let name: String
    let age: Int
}

let foo = Person(
    name: "Foo",
    age: 20
)

foo.name
foo.age


struct CommodoreComputer {
    let name: String
    let manufacturer: String // when you want to use manufacturer name in your program, but it is always same use init
    
    init(name: String) {
        self.name = name
        self.manufacturer = "Commodore"
    }
}

let c64 = CommodoreComputer(name: "C64")
c64.name
c64.manufacturer



struct Person2 {
    let firstName: String
    let lastName: String
    // let fullName: String // you can't do "\(firstName) \(lastName)", you can in initializer, or...
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}

let fooBar = Person2(firstName: "Foo", lastName: "Bar")
fooBar.fullName



struct Car {
    var currentSpeed: Int
    mutating func drive(speed: Int) {
        "Driving..."
        currentSpeed = speed
    }
}

let immutableCar = Car(currentSpeed: 10)
//immutableCar.drive(speed: 20)

var mutableCar = Car(currentSpeed: 10)
mutableCar.drive(speed: 20)
let copy = mutableCar // no connections between. Let's check..
mutableCar.drive(speed: 30)
mutableCar.currentSpeed
copy.currentSpeed


struct LivingThing {
    init() {
        "I'm a living thing"
    }
}

//struct Animal: LivingThing { // no inheritance in swift
//
//
//}


struct Bike {
    let manufacturer: String
    let currentSpeed: Int // when you want to change the variable outside the struct, you need to use var. Or..
    func copy(currentSpeed: Int) -> Bike {
        Bike(manufacturer: self.manufacturer, currentSpeed: currentSpeed)
    }
}

let bike1 = Bike(manufacturer: "HD", currentSpeed: 20)

var bike2 = bike1.copy(currentSpeed: 30)
bike1.currentSpeed
bike2.currentSpeed

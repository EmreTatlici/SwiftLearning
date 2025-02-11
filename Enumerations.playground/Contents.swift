import Foundation

// Defining an enum `Animals` with different animal cases
enum Animals {
    case cat
    case dog
    case rabbit
    case hedgehog
}

// Creating an instance of `Animals` enum and assigning it to `cat`
let cat = Animals.cat
cat

// Using a switch statement to handle each case of the `cat` instance
switch cat {
case .cat:
    "This is a cat" // Prints when the case is `cat`
    break
case .dog:
    "This is a dog" // Prints when the case is `dog`
    break
case .rabbit:
    "This is a rabbit" // Prints when the case is `rabbit`
    break
case .hedgehog:
    "This is a hedgehog" // Prints when the case is `hedgehog`
    break
}

// Uncomment the following to see the warning about exhaustive switch statements
// `switch` must be exhaustive (cover all cases) unless there's a `default` case.
// default: "This is something else" // Uncomment to handle other cases if missing


// Defining an enum `Shortcut` with associated values and making it Equatable
enum Shortcut: Equatable {
    case fileOrFolder(path: URL, name: String)
    case wwwUrl(path: URL)
    case song(artist: String, songName: String)
}

// Creating an instance of `Shortcut` for a URL to Apple website
let wwwApple = Shortcut.wwwUrl(
    path: URL(string: "https:\\apple.com")! // Force unwrap because URL may be nil, Swift doesn't allow nil here
)

// Comparing two enum values (equatable conformance is required)
if wwwApple == Shortcut.wwwUrl(path: URL(string: "https:\\apple.com")!) {
    // This block will execute if both instances are equal
}


switch wwwApple {
case let .fileOrFolder(path, name):
    // Accessing associated values of `fileOrFolder` case
    path
    name
    break
case let .wwwUrl(path):
    // Accessing associated value of `wwwUrl` case
    path
    break
case let .song(artist, songName):
    // Accessing associated values of `song` case
    artist
    songName
    break
}

// `if case let` pattern matching allows us to extract associated values directly
if case let .wwwUrl(path) = wwwApple {
    path
}

// Handling associated values for `song` case, and accessing `songName`
let withoutYou = Shortcut.song(
    artist: "Symphony X",
    songName: "Without You"
)

if case let .song(_, songName) = withoutYou {
    songName
}

if case let .song(artist, songName) = withoutYou {
    artist
    songName
}


// Defining an enum `Vehicle` with cases that hold associated values
enum Vehicle {
    case car(manufacturer: String, model: String)
    case bike(manufacturer: String, yearMade: Int)
    
    // Computed property that returns the manufacturer of the vehicle
    var manufacturer: String {
        switch self {
        case let .car(manufacturer, _):
            return manufacturer
        case let .bike(manufacturer, _):
            return manufacturer
        }
    }
}

// Creating instances of `Vehicle`
let car = Vehicle.car(manufacturer: "Tesla", model: "X")
car.manufacturer // Accessing the manufacturer of the car

let bike = Vehicle.bike(manufacturer: "HD", yearMade: 1987)
bike.manufacturer // Accessing the manufacturer of the bike


// Defining an enum `FamilyMember` with raw values (String)
enum FamilyMember: String {
    case father = "Dad"
    case mother = "Mom"
    case brother = "Bro"
    case sister = "Sis"
}

FamilyMember.father.rawValue  // Returns "Dad"


// Defining an enum `FavoriteEmoji` that conforms to `CaseIterable` to access all cases
enum FavoriteEmoji: String, CaseIterable {
    case rocky = "😜"
    case love = "🥰"
}

// Accessing all cases in the enum
FavoriteEmoji.allCases  // Returns an array of all cases
FavoriteEmoji.allCases.map(\.rawValue) // Maps the raw values of all cases into an array

// Pattern matching with `rawValue` to find an emoji by its string
if let love = FavoriteEmoji(rawValue: "🥰") {
    "Found the love emoji"  // Will execute
    love
} else {
    "This emoji doesn't exist"  // Will not execute
}

// Handling a case where an emoji doesn't exist in the enum
if let snow = FavoriteEmoji(rawValue: "🌨️") {
    "Snow exists?! Really?"
    snow
} else {
    "As expected, snow doesn't exist in our enum"  // Will execute
}


// Defining an enum `Height` with a mutating function to change its case
enum Height {
    case short, medium, long
    
    // A mutating function to change the height to `.long`
    mutating func makeLong() {
        self = .long
    }
}

var myHeight = Height.medium
myHeight.makeLong()  // Changes the value of `myHeight` to `.long`
myHeight


// Defining an indirect enum `IntOperation` to represent various mathematical operations
indirect enum IntOperation {
    case add(Int, Int)
    case substract(Int, Int)
    case freeHand(IntOperation)
    
    // Recursive function to calculate results of operations
    func calculateResult(of operation: IntOperation? = nil) -> Int {
        switch operation ?? self {
        case let .add(lhs, rhs):
            return lhs + rhs
        case let .substract(lhs, rhs):
            return lhs - rhs
        case let .freeHand(operation):
            return calculateResult(of: operation) // Recursive call to calculate the result of a nested operation
        }
    }
}

// Example usage of `IntOperation`
let freeHand = IntOperation.freeHand(.add(2, 4))

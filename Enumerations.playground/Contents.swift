import Foundation


enum Animals {
    case cat
    case dog
    case rabbit
    case hedgehog
}

let cat = Animals.cat
cat

switch cat {
case .cat:
    "This is a cat"
    break
case .dog:
    "This is a dog"
    break
//case .rabbit:
//    "This is a rabbit"
case .rabbit:
    "This is a rabbit"
    break
case .hedgehog:
    "This is a hedgehog"
    break
//default:
//    "This is something else" // switch must be exhaustive, meaning that it should have all the cases, when not, it has default
}


enum Shortcut: Equatable {
    case fileOrFolder(path: URL, name: String)
    case wwwUrl(path: URL)
    case song(artist: String, songName: String)
}

let wwwApple = Shortcut.wwwUrl(
    path: URL(string: "https:\\apple.com")! // use ! because the url might be nil, swift doesn't allow it
)

// In Swift, to compare an enum using the == operator, the enum must conform to the Equatable protocol.
if wwwApple == Shortcut.wwwUrl(path: URL(string: "https:\\apple.com")!) {
    
}



switch wwwApple {
    
case let .fileOrFolder(
    path,
    name
):
    path
    name
    break
    
case let .wwwUrl(
    path
):
    path
    break
    
case let .song(
    artist, songName
):
    artist
    songName
    break
}

if case let .wwwUrl(path) = wwwApple {
    path
}

let withoutYou = Shortcut.song(
    artist: "Symphony X",
    songName: "Without You"
)

if case let .song(_ , songName) = withoutYou {
    songName
}
if case let .song(artist , songName) = withoutYou {
    artist
    songName
}


enum Vehicle {
    case car(manufacturer: String, model: String)
    case bike(manufacturer: String, yearMade: Int)
    
    var manufacturer: String {
        switch self {
        case let .car(manufacturer, _):
            return manufacturer
            
        case let .bike(manufacturer, _):
            return manufacturer
        }

    }
}


//func getManufacturer(from vehicle: Vehicle) -> String { // or put that in enum
//    switch vehicle {
//    case let .car(manufacturer, _):
//        return manufacturer
//        
//    case let .bike(manufacturer, yearMade):
//        return manufacturer
//    }
//
//}

let car = Vehicle.car(manufacturer: "Tesla", model: "X")
car.manufacturer

let bike = Vehicle.bike(manufacturer: "HD", yearMade: 1987)
bike.manufacturer


enum FamilyMember: String {
    case father = "Dad"
    case mother = "Mom"
    case brother = "Bro"
    case sister = "Sis"
}

FamilyMember.father.rawValue

enum FavoriteEmoji: String, CaseIterable {
    case rocky = "😜"
    case love = "🥰"
}

FavoriteEmoji.allCases
FavoriteEmoji.allCases.map(\.rawValue) // .map converts all the values in arrays, dicts

if let love = FavoriteEmoji(rawValue: "🥰") {
    "Found the love emoji"
    love
} else {
    "this emoji doesn't exist"
}



if let snow = FavoriteEmoji(rawValue: "🌨️") {
    "Snow exists?! Really?"
    snow
} else {
    "As expected, snow doesn't exist in our enum"
}

enum Height {
    case short, medium, long
    // when using mutating func, self (all cases in enum) can be mutated.
    mutating func makeLong() {
        self = .long
    }
}

var myHeight = Height.medium
myHeight.makeLong()
myHeight


indirect enum IntOperation {
    case add(Int, Int)
    case substract(Int, Int)
    case freeHand(IntOperation)
    
    func calculateResult(
        of operation: IntOperation? = nil
    ) -> Int {
        switch operation ?? self {
        case let .add(lhs, rhs):
            return lhs + rhs
        case let .substract(lhs, rhs):
            return lhs - rhs
        case let .freeHand(operation):
            return calculateResult(of: operation)
        }
    }
}

let freeHand = IntOperation.freeHand(.add(2, 4))






let flowers = ["Rose", "Lily","Sunflower","Lotus","Water lily","Daffodil"]
print("For in over an array")
//for in loop can be used to iterate over a sequence (arrays, ranges, strings,dictionaries and others)
for flower in flowers{
    print(flower)
}


//for in over dictionary
//Each item in the dictionary is returned as a (key, value) tuple when the dictionary is iterated
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4,"dog":4,"kangaroo":2]

print("For in over a dictionary")
for (animal,legs) in numberOfLegs{
    print(animal,"has",legs,"legs")
}
/*
cat has 4 legs
ant has 6 legs
dog has 4 legs
kangaroo has 2 legs
spider has 8 legs
*/

print("For in over a range")
for index in 50...55{ // ... is a closed range that includes both the endpoints
    print(index)
}
/*
As such, index doesn’t have to be declared before it’s used. 
It’s implicitly declared simply by its inclusion in the loop declaration, without the need for a let declaration keyword.
*/

let minutes = 60

for tickMark in 0..<minutes{ // this is half open range, here the begining of the range included and upper bound is not
    //render the tick   
}



//stride
let minuteInterval = 5
for tickMark in stride(from:1, to:minutes, by:minuteInterval){
     // render the tick mark every 5 minutes (0, 5, 10, 15 ... 45, 50, 55)
}


let hours = 12
let hourInterval = 3
//Closed ranges are also available, by using stride(from:through:by:)
for tickMark in stride(from:3, through:hours, by:hourInterval){
// render the tick mark every 3 hours (3, 6, 9, 12)
}


func testDefer(){
    defer{
        print("deferring....")        
    }

    print("this is the first statement")

    print("this is the last statement")
}

testDefer()

// If a branch’s condition is true, then that branch’s value is used as the value for the
// whole if expression in the assignment of weatherAdvice.
let temperatureInFahrenheit = if 5<6{
    42
}else{
    02
}

//All the branches of if need to contain values if the same type. Instead we can explicitly assign a type like below
let freezeWarning: String? = if temperatureInCelsius <= 0 {
    "It's below freezing. Watch for ice!"
} else {
    nil
}


//An alternate way to provide this type information is to provide an explicit type for nil, 
//instead of providing an explicit type for freezeWarning
let temperatureInCelsius = 42
let freezeWarningTwo = if temperatureInCelsius <= 0 {
    "It's below freezing. Watch for ice!"
} else {
    nil as String?
}


let someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the Latin alphabet")
case "z":
    print("The last letter of the Latin alphabet")
default:
    print("Some other character")
}
// Prints "The last letter of the Latin alphabet"

//Like if statements switch also has an expression form, You can use switch expressions on the right-hand side of an assignment, 
//as shown in the example below, and as the value that a function or closure returns.
let anotherCharacter = "g"

let message = switch anotherCharacter {
case "a":
    "The first letter of the Latin alphabet"
case "z":
    "The last letter of the Latin alphabet"
default:
    "Some other character"
}

print(message)


//Values in switch cases can be checked for their inclusion in an interval.
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
let naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")
// Prints "There are dozens of moons orbiting Saturn."

let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
}
// Prints "(1, 1) is inside the box"

//Value binding 
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}
// Prints "on the x-axis with an x value of 2"

// The example below categorizes an (x, y) point on the following graph:

let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}
// Prints "(1, -1) is on the line x == -y"

//Compound cases:

let someCharacterTwo: Character = "e"
switch someCharacterTwo {
case "a", "e", "i", "o", "u":
    print("\(someCharacterTwo) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
    "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacterTwo) is a consonant")
default:
    print("\(someCharacterTwo) isn't a vowel or a consonant")
}
// Prints "e is a vowel"

let num = 32

switch num{
    case 1...10:
        print("between 1 and 10")
    case 30...40:
        print("between 30 and 40")
        fallthrough
    case 41...50:
        print("between 40 and 50")
    case 51...60:
        print("between 50 and 60")
    default:
        print("default")
}


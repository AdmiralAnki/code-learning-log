//Declare multiple constans or variables in a single line
var x=0.0, y=0.0, z=0.0, plane3D = true

//define multiple related variables or constants of the same type on a single line, 
//separated by commas, with a single type annotation after the final variable name
var red,green,blue:String

red = "red"
green = "green"
blue = "blue"

print(red,green,blue)

let g,h,j:Int

g=10
h=14
j=99

print(g,h,j)
//Constant and variable names can contain almost any character, including Unicode characters:
let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"

print("Min int: ",Int.min)
print("Max int: ",Int.max)


let typeInference = 8 * 0.6

print(typeInference)

//formatting for numeric literals for easy readability
let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

//Integer conversions:
let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)
//The constant sum is inferred to be UInt16 as both the constants on right side of the equation are UInt16

let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi = Double(three) + pointOneFourOneFiveNine
// pi equals 3.14159, and is inferred to be of type Double

let anotherPi = 3 + 0.14159
// anotherPi is also inferred to be of type Double

let integerPi = Int(pi)
print("Double to int conversion: ",integerPi)
//The rules for combining numeric constants and variables are different from the rules for numeric literals.
// The literal value 3 can be added directly to the literal value 0.14159,
// because number literals don’t have an explicit type in and of themselves. 
//Their type is inferred only at the point that they’re evaluated by the compiler.


typealias ListOfStrings = [String]

var names:ListOfStrings = ["Sunny","Summer"]
print(names.count)


let http404Error = (404, "Not Found")

print("tupple value 1",http404Error.0)
print("tupple value 2",http404Error.1)

//You can name the individual elements in a tuple when the tuple is defined:
let http200Status = (statusCode: 200, description: "OK")
print("tupple code: ", http200Status.statusCode)
print("tupple desc: ",http200Status.description)

//Optionals
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)


//Implicitly unwrapped Optionals
let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString // Unwrapped automatically

let optionalString = assumedString
// The type of optionalString is "String?" and assumedString isn't force-unwrapped.
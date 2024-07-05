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

//formatting for numeric literals
let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1
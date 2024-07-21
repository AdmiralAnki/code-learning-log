let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""

print(quotation)

let softWrappedQuotation = """
        The White Rabbit put on his spectacles.  "Where shall I begin, \
        please your Majesty?" he asked.

        "Begin at the beginning," the King said gravely, "and go on \
        till you come to the end; then stop."
        """
//In the example above, even though the entire multiline string literal is indented, 
//the first and last lines in the string don’t begin with any whitespace
print(softWrappedQuotation)


let sample = "this is a sample string"

print("Start index:", sample.startIndex)
print(sample.index(sample.startIndex, offsetBy: 8))

for index in sample.indices{
    print("\(sample[index]) ",terminator: "")
}
print("")


var welcome = "hello"
welcome.insert("!", at: welcome.endIndex)
// welcome now equals "hello!"


welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex))
// welcome now equals "hello there!"

welcome.insert(contentsOf: "Collection ", at: welcome.startIndex)

print(welcome)

let greeting = "Hello, world!"
let index = greeting.firstIndex(of: ",") ?? greeting.endIndex
let beginning = greeting[..<index]

beginning.index(after: beginning.startIndex)
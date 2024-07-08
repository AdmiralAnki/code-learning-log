import Foundation
/**
	This function checks if there are command line arguments present and prints them.
*/
func readFromCommandline(){

	if CommandLine.argc > 1{
		 for (index,argument) in CommandLine.arguments.enumerated(){
			print("index: ",index," argument: ",argument)
		}
	}else{
		print("No arguments passed")
	} 
}

/**
	This function read from standard input until program terminates
*/

func readSTDIN(){	
	while let line = readLine(){ 
		print("STDIN: \(line)")	
	}
}

/**
	This function reads from standard input and parses the input String to two integers and then prints the sum
*/
func addTwoNumbersSTDIN(){
	if let line = readLine(){
		if let num  = Int(line.split(separator:" ")[0]),
		   let num2 = Int(line.split(separator: " ")[1]){
			print(num+num2)
		}
	}
}

/**
	This function reads the from standard input two numbers and prints their sum
*/
func addTwoNumbersSTDINApproachTwo(){	
	if let firstNum = readLine(),
	let secondNum = readLine(){
		print("Sum:",(Int(firstNum) ?? 0) + (Int(secondNum) ?? 0))
	}

}

/**
	This function write to standard output, demonstrates some basic capabilites of the print() function
*/
func writeToOutput() {

	print("test")
	// standard separator and terminator
	print("test","this","method","again")

	//custom separator
	print(1,2,3,4,5,separator:"***")

	//custom teminator
	print("ffff",terminator:"]")
	print("gggg",terminator:"]")

}

/**
	This function demonstrates the print() function that writes the o/p to the given output stream(TextOutputStream)
*/
func writeToTarget(){

	var range = "My range: "
	print(1...5, to: &range)

	print(range)

	var separated = ""
	print(1.0, 2.0, 3.0, 4.0, 5.0, separator: " ... ", to: &separated)

	print(separated)
}

/**
	Swift script to write contents of one file to other(also adds line numbers). This methods takes the file content from standard input and writes it to standard output. 

	Usage:

	`cat sourceFile.txt | swift inputAndOutput.swift | >  destinationFile.txt `
*/
func rewriteFileContent(){
	var lineNumber = 0
	while let line = readLine(){ 
		lineNumber+=1
		print("\(lineNumber).\(line)")	
	}
}


/**
	Swift script to write contents of one file to other. This methods takes two command line arguments the source file and the destination file.
	It then uses the string methods to read and write content from the files.	
*/

func copyFileContent(){
	if  CommandLine.argc > 1{
		let sourceFile = CommandLine.arguments[1]
		let destinationFile = CommandLine.arguments[2]
		do{
			let fileContent = try String(contentsOfFile: sourceFile)
			let contents = fileContent.split(separator: "\n")
			var newFileContent = ""

			for content in contents{
				newFileContent += "imported line \(content)\n"	
			}

			try newFileContent.write(toFile: destinationFile, atomically: true, encoding: .utf8)

		}catch{
			print(error.localizedDescription)
		}
	}else{
		print("invalid input")
	}
}

/*
	This function uses FileHandle class to read bytes from a file asynchronously and then write each line to the destination file
*/

func copyFileContentO(){
	if  CommandLine.argc > 1{
		let sourceFile = CommandLine.arguments[1]
		let destinationFile = CommandLine.arguments[2]

		guard let sourceFileHandle =  FileHandle(forReadingAtPath: sourceFile) else {print("Couldn't open source file!"); return}

		guard let destinationFileHandle = FileHandle(forWritingAtPath: destinationFile) else {print("Couldn't open dest file!");return}

	do{
		let modifiedLine = "The following content was imported: \n"
		try destinationFileHandle.write(contentsOf: modifiedLine.data(using: .utf8)!)

		Task{
			for try await line in sourceFileHandle.bytes.lines{				
				try destinationFileHandle.write(contentsOf: line.data(using: .utf8)!)
			}	
		}			
	}catch{
		print("error: \(error.localizedDescription)")
	}	
	}else{
		print("invalid input")
	}
}

// copyFileContentO()
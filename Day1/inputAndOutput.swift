import Foundation

func showSample(){

	if CommandLine.argc > 1{
		 for (index,argument) in CommandLine.arguments.enumerated(){
			print("index: ",index," argument: ",argument)
		}
	}else{
		print("No arguments passed")
	} 
}

func readSTDIN(){	
	while let line = readLine(){ 
		print("STDIN: \(line)")	
	}
}

func addTwoNumbersSTDIN(){
	if let line = readLine(){
		if let num  = Int(line.split(separator:" ")[0]),
		   let num2 = Int(line.split(separator: " ")[1]){
			print(num+num2)
		}
	}
}

func writeToOutput(){

print("test")
// standard separator and terminator
print("test","this","method","again")

//custom separator
print(1,2,3,4,5,separator:"***")

//custom teminator
print("ffff",terminator:"]")
print("gggg",terminator:"]")

}

func writeToTarget(){

var range = "My range: "
print(1...5, to: &range)

print(range)

var separated = ""
print(1.0, 2.0, 3.0, 4.0, 5.0, separator: " ... ", to: &separated)

print(separated)
}

/*
	Swift script to write contents of one file to other. This methods takes the file content from standard input and writes it to standard output. 
	Both input and output can be give using the following shell command:
 	use the cat newTestFile.txt | swift inputAndOutput.swift | >  someNewFile.txt 
*/
func rewriteFileContent(){
	var lineNumber = 0
	while let line = readLine(){ 
		lineNumber+=1
		print("\(lineNumber).\(line)")	
	}
}


/*
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

copyFileContentO()
extension FileHandle{

func readLine(){

}

}
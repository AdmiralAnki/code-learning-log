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
	let tew = readLine() ?? "No input provided"
	print("STDIN: \(tew)") 
}

readSTDIN()

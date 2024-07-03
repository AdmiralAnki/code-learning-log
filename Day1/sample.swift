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

	while(true){
		
		if let line = readLine(){ 
			print("STDIN: \(line)")
		}else{
		 	break
		}		
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


addTwoNumbersSTDIN()


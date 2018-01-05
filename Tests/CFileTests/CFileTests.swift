import XCTest
@testable import CFile

class CFileTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        var File = CFile(path : "/home/rafael/Desktop/archivo.txt")

        print("FilePath: \(File.FilePath)")

        if File.writable() {
        	print("File is writable")
        } else {
        	print("File not is writable")
        }
        

        if File.readable() {
        	print("File is readable")
        } else {
        	print("File not is readable")
        }
        
        //All Str
        print("Reading File All: \(File.StrAll().data)")

        //read one line
        print("Reading File: \(File.Str().data)")

        //write word for example
        if File.Write(Word : "Welcome to CFile 2") {
			print("Data is Write")
        }


        //serialize
        var ArrayString : Array<String>
        ArrayString = File.Serialize(delimiter : [" ", "\n"], ignore : nil, node : ["---->", "=>", "(", ")"]);
        for word in ArrayString {
        	print(word)
        }
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}

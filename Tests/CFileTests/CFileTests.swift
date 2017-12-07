import XCTest
@testable import CFile

class CFileTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        var ArrayString : Array<String>

        var File = CFile(FileName : "/home/rafael/Desktop/archivo.txt", Mode : "a+")
        if (File.FilePointer == nil) {
        	print("Error al leer el archivo")
        } else {
        	print("archivo aperturado")
        }
        //write word for example
        File.Write(Word : "Welcome to CFile")   
        //read one line
        print("Reading File: \(File.Str())")

        //All Str
        print("Reading File All: \(File.StrAll())")

        //serialize
        ArrayString = File.Serialize(delimiter : [" ", "W"], ignore : ["\n"]);
        for word in ArrayString {
        	print(word)
        }

        //Close Pointer
        File.Close()
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}

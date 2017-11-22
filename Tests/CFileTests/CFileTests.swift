import XCTest
@testable import CFile

class CFileTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        var File = CFile(FileName : "/home/rafael/Desktop/archivo.txt", Mode : "a+")
        if (File.FilePointer == nil) {
        	print("Error al leer el archivo")
        } else {
        	print("archivo aperturado")
        }

        File.Close(FilePointerClose : File.FilePointer!)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
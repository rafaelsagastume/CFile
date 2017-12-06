//===---------------------------------------------------------------------===//
//
// Autor: Rafael Fernando Garcia Sagastume.
// Escuintla, Guatemala
//
// Propocito general, es realizar la manipulación de los archivos.
//
// Copyright © 2017 Rafael Fernando Garcia Sagastume.
//===----------------------------------------------------------------------===//

import CoreCFile
import CoreFile


public class CFile {
	
	var FilePointer : UnsafeMutablePointer<FILE>?


	public init(FileName : UnsafePointer<Int8>!, Mode : UnsafePointer<Int8>!) {
        FilePointer = fopen(FileName, Mode)
	}


	public func Close() {
		fclose(FilePointer)
	}


	public func Write(Word : UnsafePointer<Int8>!) {
		fputs(Word, FilePointer)
	}


	public func Str() -> String {
		return String(cString: CGetString(FilePointer))
	}


	public func StrAll() -> String {
		var c : Int
		var string : String = ""

		rewind(FilePointer)

		while true {

			//Int32 -> C  [To]  Int -> Swift
			c = Int(fgetc(FilePointer))

			if feof(FilePointer) == 1 {
				break ;
			}

			string = string + String(Character(UnicodeScalar(c)!))
		}

		return string
	}
}
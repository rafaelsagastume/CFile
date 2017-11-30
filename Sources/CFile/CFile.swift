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
}
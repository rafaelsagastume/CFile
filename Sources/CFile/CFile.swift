//===-------------- costo_minimo.c ---------------------------------------===//
//
// Autor: Rafael Fernando Garcia Sagastume.
// Escuintla, Guatemala
//
// Propocito general, es realizar la manipulación de los archivos.
//
// Copyright © 2017 Rafael Fernando Garcia Sagastume.
//===----------------------------------------------------------------------===//

import CoreCFile


public class CFile {
	
	var FilePointer : UnsafeMutablePointer<FILE>?


	public init(FileName : UnsafePointer<Int8>!, Mode : UnsafePointer<Int8>!) {
        FilePointer = fopen(FileName, Mode)
	}


	public func Close(FPointer : UnsafeMutablePointer<FILE>) {
		fclose(FPointer)
	}


	public func Write(FPointer : UnsafeMutablePointer<FILE>, Word : UnsafePointer<Int8>!) {
		fputs(Word, FPointer)
	}

}
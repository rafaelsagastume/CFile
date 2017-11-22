import CoreCFile

public class CFile {
	
	var FilePointer : UnsafeMutablePointer<FILE>?

	public init(FileName : UnsafePointer<Int8>!, Mode : UnsafePointer<Int8>!) {
        FilePointer = fopen(FileName, Mode)
	}


	public func Close(FilePointerClose : UnsafeMutablePointer<FILE>) {
		fclose(FilePointerClose)
	}

}
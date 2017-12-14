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
import Foundation


public class CFile {
	
	var FilePointer : UnsafeMutablePointer<FILE>?


	public init(FileName : UnsafePointer<Int8>!, Mode : UnsafePointer<Int8>!) {
        FilePointer = fopen(FileName, Mode)
	}


	public func exists(path : UnsafePointer<Int8>) -> Bool {
		var File : UnsafeMutablePointer<FILE>?

		File = fopen(path, "r")

		if File != nil {
			fclose(File)
			return true
		}
		return false
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


	public func Serialize(delimiter : Array<String>, ignore : Array<String>!, node : Array<String>!) -> Array<String> {
		var wordList : Array<String> = []
		var stringFile : String
		var word : String = ""
		var addChar : Int = 0
		var addCharIndex : Int = 0

		stringFile = self.StrAll()

		for (_ , char) in stringFile.enumerated() {
			addCharIndex = 1

			for (_ , charDelimiter) in delimiter.enumerated() {
				if String(char) == charDelimiter {
					addCharIndex = 0
					break
				}
			}

			if addCharIndex == 1 {
				addChar = 1

				if ignore != nil {
					for (_ , charIgnore) in ignore.enumerated() {
						if String(char) == charIgnore {
							addChar = 0
							break
						}
					}
				}

				if addChar == 1 {
					word = word + String(char)
				}
			} else {

				if node != nil {
					var wordTemp : String = word
			
					//[-->]
					for wordNode in node {

						wordTemp = wordTemp.replacingOccurrences(of: wordNode, with: "\(delimiter[0])\(wordNode)\(delimiter[0])")
						wordTemp = wordTemp.replacingOccurrences(of: "\(delimiter[0])\(delimiter[0])", with: "\(delimiter[0])")

					}

					var ListNewWord = wordTemp.components(separatedBy: delimiter[0])

					for wordNew in ListNewWord {
						wordList.append(wordNew)
					}

					word = ""
				} else {
					wordList.append(word)
					word = ""
				}
				
			}
		}

		if word != "" {
			wordList.append(word)
			word = ""
		}

		return wordList
	}
}

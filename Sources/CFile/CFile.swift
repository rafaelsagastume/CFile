//===---------------------------------------------------------------------===//
//
// Autor: Rafael Fernando Garcia Sagastume.
// Escuintla, Guatemala
//
// Propósito general, es realizar la manipulación de los archivos.
//
// Copyright © 2017 Rafael Fernando Garcia Sagastume.
//===----------------------------------------------------------------------===//

import Foundation

public class CFile {


	var FilePath : String = ""


	public init(path : String) {
		self.FilePath = path
	}



	public func writable() -> Bool {
		var File : UnsafeMutablePointer<FILE>?
		File = fopen(self.FilePath, "r+")

		if File != nil {
			fclose(File)
			return true
		}
		return false
	}



	public func readable() -> Bool {
		var File : UnsafeMutablePointer<FILE>?
		File = fopen(self.FilePath, "r")

		if File != nil {
			fclose(File)
			return true
		}
		return false
	}



	public func Write(Word : String) -> Bool {

		if self.readable() {
			var File : UnsafeMutablePointer<FILE>?
			File = fopen(self.FilePath, "a+")

			fputs(Word, File)

			return true
		} else {
			return false
		}
			
	}



	public func Str() -> (error: Bool, data: String) {

		if self.readable() {
			var c : Int
			var string : String = ""

			var File : UnsafeMutablePointer<FILE>?
			File = fopen(self.FilePath, "r")

			rewind(File)

			while true {

				//Int32 -> C  [To]  Int -> Swift
				c = Int(fgetc(File))

				if feof(File) == 1 {
					break ;
				}

				string = string + String(Character(UnicodeScalar(c)!))
			}

			return (false, string)
		} else {
			return (true, "")
		}
	}


	public func Serialize(delimiter : Array<String>, ignore : Array<String>!, node : Array<String>!) -> Array<String> {
		var wordList : Array<String> = []
		var stringFile : String
		var word : String = ""
		var addChar : Int = 0
		var addCharIndex : Int = 0

		stringFile = self.Str().data

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



	// Load a simple configuration file
	// Assuming that there are variables in the file with values to be used
	public func LoadConfig() -> [String:String]! {

		var Dict = [String:String]()
		var listLine : Array<String> = []

		if self.readable() {
			var c : Int
			var string : String = ""

			var File : UnsafeMutablePointer<FILE>?
			File = fopen(self.FilePath, "r")

			rewind(File)

			while true {

				//Int32 -> C  [To]  Int -> Swift
				c = Int(fgetc(File))

				if feof(File) == 1 {
					break ;
				}

				if String(Character(UnicodeScalar(c)!)) != "\n"{
					string = string + String(Character(UnicodeScalar(c)!))
				} else {
					listLine.append(string)
					string = ""
				}
			}

			listLine.append(string)

			for word in listLine {
	        	if word != "" {
	        		var Line = word.components(separatedBy: "=")
	        		Dict[String(Line[0]).trimmingCharacters(in: .whitespaces)] = Line[1].trimmingCharacters(in: .whitespaces)
	        	}
	        }

			return Dict
		}

	 	return nil
	}
}

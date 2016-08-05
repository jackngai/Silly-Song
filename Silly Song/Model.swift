//
//  Model.swift
//  Silly Song
//
//  Created by Jack Ngai on 8/5/16.
//  Copyright © 2016 Jack Ngai. All rights reserved.
//

import Foundation

internal let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joinWithSeparator("\n")


internal func lyricsForName(name: String, template: String)->String{
    var lyric = template.stringByReplacingOccurrencesOfString("<FULL_NAME>", withString: name)
    lyric = lyric.stringByReplacingOccurrencesOfString("<SHORT_NAME>", withString: shortNameFromName(name))
    return lyric
}

private func shortNameFromName(fullName: String)->String{
    var shortName = fullName.lowercaseString
    for character in shortName.characters{
        switch character {
        case "a", "e", "i", "o", "u":
            return shortName
        default:
            shortName = String(shortName.characters.dropFirst())
        }
    }
    print("Name does not have a vowel")
    return fullName.lowercaseString
    
//  /* code provided in lesson */
//    let lowercaseName = fullName.lowercaseString
//    let vowelSet = NSCharacterSet(charactersInString: "aeioöu")
//    if let firstVowelRange = fullName.rangeOfCharacterFromSet(vowelSet, options: .CaseInsensitiveSearch){
//        return lowercaseName.substringFromIndex(firstVowelRange.startIndex)
//    }
//    return lowercaseName
}
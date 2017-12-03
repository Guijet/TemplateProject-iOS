//
//  StringVerifications.swift
//  ArtifexApp
//
//  Created by Guillaume Jette on 2017-11-26.
//  Copyright © 2017 Guillaume Jette. All rights reserved.
//

import UIKit

extension String{
    
    //Verify if string contains
    //a capital letter
    //
    func containsCaps()->Bool{
        return self.range(of: "[A-Z]", options: .regularExpression) != nil
    }
    
    //Verify if string contains
    //a number
    //
    func containerNumber()->Bool{
        let decimalCharacters = CharacterSet.decimalDigits
        let decimalRange = self.rangeOfCharacter(from: decimalCharacters)
        return decimalRange != nil
    }
    
    //Validate string characters count
    //with max and/or min
    //
    //Verify with max
    func verifyLenght(max:Int)->Bool{
        return self.count <= max
    }
    //Verify with min
    func verifyLenght(min:Int)->Bool{
        return self.count >= min
    }
    //Verify with min and max
    func verifyLenght(max:Int,min:Int)->Bool{
        return self.count >= min && self.count <= max
    }
    
    //Verify if string contains --> @
    //
    //
    func isValidEmail()->Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    //Substring remake with Swift 4 depracated version
    //
    //
    func substring(from: Int,to: Int)->String {
        let sArr = Array(self.utf8)
        var result: String = ""
        for x in from...to - 1 {
            result += String(Character(UnicodeScalar(sArr[x])))
        }
        return result
    }
    
    //Separate string at Index (int value of index pass)
    //
    //
    func separate(separationNumber: Int) -> String {
        let sArr = Array(self.utf8)
        var result: String = ""
        var indexToSeparate = 0
        var charIndex = self.count - 1
        while( charIndex >= 0) {
            indexToSeparate += 1
            result = "\(String(Character(UnicodeScalar(sArr[charIndex]))))\(result)"
            if(indexToSeparate  ==  separationNumber) {
                result = " \(result)"
                indexToSeparate = 0
            }
            charIndex -= 1
            
        }
        return result
    }
}

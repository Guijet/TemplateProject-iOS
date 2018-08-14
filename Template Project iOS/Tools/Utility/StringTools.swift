//
//  StringVerifications.swift
//  ArtifexApp
//
//  Created by Guillaume Jette on 2017-11-26.
//  Copyright © 2017 Guillaume Jette. All rights reserved.
//

import UIKit
import Foundation

extension String{
    
    func containsCaps()->Bool{
        return self.range(of: "[A-Z]", options: .regularExpression) != nil
    }
    
    func containerNumber()->Bool{
        let decimalCharacters = CharacterSet.decimalDigits
        let decimalRange = self.rangeOfCharacter(from: decimalCharacters)
        return decimalRange != nil
    }
    
    func verifyLenght(min:Int = 0,max:Int = 0)->Bool{
        if(min == 0){
            return self.count >= min
        }
        else if(max == 0){
            return self.count <= 30
        }
        else{
           return self.count >= min && self.count <= max
        }
    }
    
    func isValidEmail()->Bool{
        return NSPredicate(format:"SELF MATCHES %@","[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}").evaluate(with: self)
    }
    
    
    func substring(from: Int,to: Int)->String {
        let sArr = Array(self.utf8)
        var result: String = ""
        for x in from...to - 1 {
            result += String(Character(UnicodeScalar(sArr[x])))
        }
        return result
    }
    
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
    
    func stringToDate(format:String)->Date{
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)!
    }
    
    func stringToUtcDate(format:String)->Date{
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)!
    }
    
    func toUTC() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let convertedDate = formatter.date(from: self)
        formatter.timeZone = TimeZone(identifier: "UTC")
        return formatter.string(from: convertedDate!).substring(from: 0, to: 19)
    }
    
    func toMyTimeZone() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.timeZone = TimeZone(identifier: "UTC")
        let convertedDate = formatter.date(from: "\(self.substring(from: 0, to: 19))")
        formatter.timeZone = TimeZone.current
        return formatter.string(from: convertedDate!).substring(from: 0, to: 19)
    }
    
    func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self, options: Data.Base64DecodingOptions(rawValue: 0)) else {
            return nil
        }
        
        return String(data: data as Data, encoding: String.Encoding.utf8)
    }
    
    func toBase64() -> String? {
        guard let data = self.data(using: String.Encoding.utf8) else {
            return nil
        }
        
        return data.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0))
    }
    
//    func dropLast(_ n: Int = 1) -> String {
//        return String(self.dropLast(n))
//    }
    
    //Format --> mm/yy
    //
    func getExpMonthFromCardFormat()->UInt{
        let arrString = self.split{$0 == "/"}.map(String.init)
        return UInt(arrString[0])!
    }
    
    //Format --> mm/yy
    //
    func getExpYearFromCardFormat()->UInt{
        let arrString = self.split{$0 == "/"}.map(String.init)
        let result = UInt("20\(arrString[1])")!
        return result
    }
    
//    var dropLast: String {
//        return dropLast()
//    }
}

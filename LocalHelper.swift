//
//  LocalHelper.swift
//  
//
//  Created by Artifex on 2018-05-07.
//

import UIKit


class LocalHelper{
    static let shared : LocalHelper = {
        let instance = LocalHelper()
        return instance
    }()
    
    func getCountriesList()->[String]{
        var countries: [String] = []
        for code in NSLocale.isoCountryCodes as [String] {
            let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])
            let name = NSLocale(localeIdentifier: "en_US").displayName(forKey: NSLocale.Key.identifier, value: id) ?? "Country not found for code: \(code)"
            countries.append(name)
        }
        return countries.sorted(by: {$0 < $1})
    }
}

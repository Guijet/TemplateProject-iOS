//
//  DatePicker.swift
//  ArtifexApp
//
//  Created by Guillaume Jette on 2017-11-18.
//  Copyright © 2017 Guillaume Jette. All rights reserved.
//

import UIKit

class DateHelper{
    var weekDay = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
    var month = ["January","Febuary","March","April","May","June","July","August","September","October","November","December"]
    
    func setUpDatePicker(textField:UITextField,control:UIViewController,bgColor:UIColor,action:Selector,event:UIControlEvents){
        let datePickerView = UIDatePicker()
        datePickerView.backgroundColor = bgColor
        datePickerView.datePickerMode = .date
        textField.inputView = datePickerView
        datePickerView.addTarget(control, action: action, for: event)
    }
    
    func getAgeFromBirthDate(birthdate:String)->Int{
        let now = Date()
        let birthday: Date = stringToDate(dateS: birthdate)
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: birthday, to: now)
        let age = ageComponents.year!
        return age
    }
    
    func stringToDate(dateS:String)->Date{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd" //Your date format
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00") //Current time zone
        let date = dateFormatter.date(from: dateS) //according to date format your date string
        return date!
    }
    
    func getDayOfWeek(date: String) -> String{
        let formatter  = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let todayDate = formatter.date(from: date)!
        let myCalendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
        let myComponents = myCalendar.components(.weekday, from: todayDate)
        let weekDayIndex = myComponents.weekday! - 1
        return self.weekDay[weekDayIndex]
    }
    
    func getWeekIndexOfDay(date: String) -> Int{
        let formatter  = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let todayDate = formatter.date(from: date)!
        let myCalendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
        let myComponents = myCalendar.components(.weekday, from: todayDate)
        let weekDay = myComponents.weekday! - 1
        return weekDay
    }
    
    func formatDate(date: String) -> String{
        var date = date
        let monthIndex = date.substring(from: 5, to: 7)
        let month = self.month[Int(monthIndex)! - 1]
        var day = date.substring(from: 8, to: 10)
        day = String(describing: Int(day)!)
        date = date.substring(from: 0, to: 10)
        return "\(getDayOfWeek(date: date)), \(day) \(month)"
    }
}

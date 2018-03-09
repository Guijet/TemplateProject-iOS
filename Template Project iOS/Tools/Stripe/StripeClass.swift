////
////  StripeClass.swift
////  InfluenceMe
////
////  Created by Guillaume Jette on 2018-01-25.
////  Copyright © 2018 Guillaume Jette. All rights reserved.
////
//
//import UIKit
//import Stripe
//
//class StripeClass{
//
//    //SINGLETON OBJECT TO USE FOR CLASS
//    //
//    static let shared : StripeClass = {
//        let instance = StripeClass()
//        return instance
//    }()
//
//    //CREAT A CARD TOKEN AND PASS THE FUNCTION TO BE MADE IN COMPLETION
//    //
//    //EXAMPLE OF HOW TO CALL FUNCTION         StripeClass.shared.getCardToken(f: printToken)
//    //
//    func getCardToken(f:@escaping (_ token:String)->()){
//
//        let client = STPAPIClient()
//        let a = STPCardParams()
//        a.number = "4242424242424242"
//        a.cvc = "0242"
//        a.expYear = 2024
//        a.expMonth = 04
//        a.name = "Jean Guy"
//
//        client.createToken(withCard: a) { (token, error) in
//            if(error == nil){
//                print(token!.tokenId)
//            }
//            else{
//                print(error!)
//            }
//        }
//    }
//
//    //BANK ACCOUNT
//    //
//    //
//    func getBankAccountToken(transitNumber:String,institutionNumber:String,accountNumber:String){
//        let client = STPAPIClient()
//        let a = STPBankAccountParams()
//        a.country = "CA"                                                //COUNTRY
//        a.routingNumber = "\(transitNumber)-\(institutionNumber)"       //"11000-000" //TRANSIT + INSTITUTIONS NUMBER
//        a.accountNumber = "\(accountNumber)"                            //ACCOUNT NUMBER
//        a.currency = "CAD"                                              //CURRENCY US OR CAD
//        client.createToken(withBankAccount: a) { (token, error) in
//            if(error == nil){
//                print(token!.tokenId)
//            }
//            else{
//                print(error!)
//            }
//        }
//    }
//}


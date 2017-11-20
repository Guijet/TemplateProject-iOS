//
//  HTTPRequest.swift
//  Template Project iOS
//
//  Created by Guillaume Jette on 2017-11-20.
//  Copyright © 2017 Guillaume Jette. All rights reserved.
//

import UIKit

class HTTPResult{
    private var _isError:Bool!
    private var _message:String!
    private var _dict:[String:Any]!
    
    init(isError:Bool,message:String = "",dict:[String:Any] = ["nil":"nil"]) {
        setIsError(isError: isError)
        setMessage(message: message)
        setDict(dict: dict)
    }
    
    func setIsError(isError:Bool){
        self._isError = isError
    }
    
    func setMessage(message:String){
        self._message = message
    }
    
    func setDict(dict:[String:Any]){
        self._dict = dict
    }
    
    func getMessage()->String{
        return self._message
    }
    
    func getIsError()->Bool{
        return self._isError
    }
    
    func getDict()->[String:Any]{
        return self._dict
    }
}

class HTTPRequest{
    //TODO: Set a timeout for maximum time
    func getJson(url:String,method:String,body:String = "",needToken:Bool = false)->HTTPResult{
        
        var finish = false
        var result: HTTPResult!         //Result that will be returned
        
        DispatchQueue.global(qos:.background).async {
            var request = URLRequest(url: URL(string: url)!)
            request.httpMethod = method
            
            if(method == "POST") {          //HANDLE POST REQUEST
                let postString = body
                request.httpBody = postString.data(using: .utf8)
            }
            else if(method == "PUT"){       //HANDLE PUT REQUEST
                let putString = body
                request.httpBody = putString.data(using: .utf8)
            }
            else if(method == "DELETE"){    //HANDLE DELETE REQUEST
                let deleteString = body
                request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
                request.httpBody = deleteString.data(using: .utf8)
            }
            else if(method == "GET"){       //HANDLE GET REQUEST
                
            }
            
            if(needToken){
                //HANDLE YOUR TOKEN
                //
                //request.addValue("Bearer \(Global.global.token)", forHTTPHeaderField: "Authorization")
            }
            
            let config = URLSessionConfiguration.default
            config.httpMaximumConnectionsPerHost = 100
            let session = URLSession(configuration: config)
            
            let task = session.dataTask(with: request) { data, response, error in
                
                guard let data = data, error == nil else {      //HANDLING NETWORKING ERRORS
                    result = HTTPResult(isError: true, message: "Network error. Can not connect to the server. Please try again later.", dict: ["nil":"nil"])
                    finish = true
                    return
                }
                
                //GETTING RESPONSE TEXT IF THERE IS NOT NETWORK ERROR AND PRINT IT IF YOU WANT TO SEE THE RESULT
                //
                //let responseText: String = String(data: data, encoding: String.Encoding.utf8)!
                //print(responseText)
                
                //HANDLING HTTP CODE ERRORS
                //
                if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                    
                    //PRINT HTTP ERRORS HERE
                    //
                    //print("statusCode should be 200, buxt is \(httpStatus.statusCode)")
                    //print("response = \(String(describing: response))")
                    
                    result = HTTPResult(isError: true, message: "Status Code should be 200, but is \(httpStatus.statusCode)", dict: ["nil":"nil"])
                }
                //HANDLE THE DATA
                do
                {
                    //JSON TO DICTIONNARY
                    if let parsedData = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any]{
                        //Retrun the result if no errors
                        result = HTTPResult(isError: false, message: "OK", dict: parsedData)
                    } else {
                        //Handle the custom response errors
                        result = HTTPResult(isError: true, message: "API Errors", dict: ["nil":"nil"])
                    }
                    //Taks ends
                    finish = true
                }
                //Catch erros during the process
                catch let error as NSError
                {
                    //print(error)
                    result = HTTPResult(isError: true, message: error.localizedDescription, dict: ["nil":"nil"])
                    //Ending taks
                    finish = true
                }
            }
            //Resume tasks
            task.resume()
            session.finishTasksAndInvalidate()
            
        }
        //While no response wait
        while(!finish) { usleep(300) }
        //Return the result
        return result
    }
    
}

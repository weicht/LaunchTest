//
//  AuthService.swift
//  LaunchTest
//
//  Created by Chris Weicht on 9/14/17.
//  Copyright © 2017 Chris Weicht. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class AuthService {
    //singleton service
    static let instance = AuthService()

    //place to store basic key/value settings
    let defaults = UserDefaults.standard
    
    var sid = ""
    
    func performLogin(username: String, password: String, callback: @escaping (_ response: String?) -> Void) {
        print("Logging in: \(username) // \(password)")
        let parameters: [String: Any] = [
            "email": username,
            "password": password
        ]
        
        let header = [
            "Content-Type": "application/json",
            "Accept": "application/json, text/plain, */*"
        ]

        var loggedInMsg = "";
        
        Alamofire.request(LOGIN_ENDPOINT, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: header).responseJSON { response in
            //            print("Request: \(String(describing: response.request))")   // original url request
            //            print("Response: \(String(describing: response.response))") // http url response
            //            print("Result: \(response.result)")                         // response serialization result
            
            let jsonData = JSON(response.result.value!)
            if (jsonData["status"] != 200) {
                print("Error with login - TBD how to respond")
                loggedInMsg = "Error with login - TBD how to respond"
            } else {
                print("Success with login - TBD how to respond")
                self.sid = jsonData["data"]["sid"].string!
                print(self.sid)
            }
            callback(loggedInMsg)
        }
    }
    
    func getProducts(){
        let header = [
            "Content-Type": "application/json",
            "Accept": "application/json, text/plain, */*",
            "Authorization": "Bearer \(self.sid)"
        ]
        
        Alamofire.request(PRODUCTS_ENDPOINT, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { response in
            //            print("Request: \(String(describing: response.request))")   // original url request
            //            print("Response: \(String(describing: response.response))") // http url response
            //            print("Result: \(response.result)")                         // response serialization result
            
            let jsonData = JSON(response.result.value!)
            print(jsonData)
            if (jsonData["status"] != "200") {
                print("Error with getting products - TBD how to respond [\(jsonData["status"])]")
            } else {
                print("Success with getting products - TBD how to respond")
            }
//            callback(loggedInMsg)
        }

    }

    func getDistributors(){
        let header = [
            "Content-Type": "application/json",
            "Accept": "application/json, text/plain, */*",
            "Authorization": "Bearer \(self.sid)"
        ]
        
        Alamofire.request(DISTRIBUTORS_ENDPOINT, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { response in
            
            let jsonData = JSON(response.result.value!)
            print(jsonData)
            if (jsonData["status"] != "200") {
                print("Error with getting distributors - TBD how to respond [\(jsonData["status"])]")
            } else {
                print("Success with getting distributors - TBD how to respond")
            }
            //            callback(loggedInMsg)
        }
        
    }



}




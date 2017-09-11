//
//  ViewController.swift
//  LaunchTest
//
//  Created by Chris Weicht on 9/9/17.
//  Copyright © 2017 Chris Weicht. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class ViewController: UIViewController {

    let LOGIN_ENDPOINT = "http://tradespacedev.bitvisory.com:8081/v1/auth/vortex/basic"
    let header = [
        "Content-Type": "application/json",
        "Accept": "application/json, text/plain, */*"
    ]

    var sid = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var error: UILabel!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBAction func signInPressed(_ sender: UIButton) {
        if (username.text!.count == 0 || password.text!.count == 0) {
            error.text! = "Username nor Password can be empty"
        } else {
            error.text! = ""
            performLogin()
        }
    }
    
    func performLogin(){
        print("Logging in: \(username.text!) // \(password.text!)")
        let parameters: [String: Any] = [
            "email": username.text!,
            "password": password.text!
        ]
        
        Alamofire.request(LOGIN_ENDPOINT, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: header).responseJSON { response in
//            print("Request: \(String(describing: response.request))")   // original url request
//            print("Response: \(String(describing: response.response))") // http url response
//            print("Result: \(response.result)")                         // response serialization result
            
            let jsonData = JSON(response.result.value!)
            if (jsonData["status"] != 200) {
                self.error.text = "Error: \(jsonData["message"])"
            } else {
                self.sid = jsonData["data"]["sid"].string!
                self.performSegue(withIdentifier:"tspLogin", sender:self);
            }
        }
    }
}


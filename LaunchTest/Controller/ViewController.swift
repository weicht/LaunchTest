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
//import AuthService


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
            AuthService.instance.performLogin(username: username.text!, password: password.text!,
                                              callback: self.loginCallback)
        }
    }
    
    
    @IBAction func logOut(_ sender: UIButton) {
        print("logOut")
    }
    
    func loginCallback(loginResponse: String?){
        error.text! = loginResponse!
        if (error.text!.count == 0){
            self.performSegue(withIdentifier:"tspLogin", sender:self)
        }
    }
}


//
//  BrandVC.swift
//  LaunchTest
//
//  Created by Chris Weicht on 9/10/17.
//  Copyright © 2017 Chris Weicht. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class BrandVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("BrandVC viewDidLoad")
        AuthService.instance.getProducts()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


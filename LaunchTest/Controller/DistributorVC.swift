//
//  DistributorVC.swift
//  LaunchTest
//
//  Created by Chris Weicht on 9/14/17.
//  Copyright © 2017 Chris Weicht. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class DistributorVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("DistributorVC viewDidLoad")
        AuthService.instance.getDistributors(callback: storeDistributors)
    }
    
    func storeDistributors(distributors: Any?){
        print(distributors!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


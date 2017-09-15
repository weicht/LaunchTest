//
//  Product.swift
//  LaunchTest
//
//  Created by Chris Weicht on 9/14/17.
//  Copyright © 2017 Chris Weicht. All rights reserved.
//

import Foundation

struct Product {
    private(set) public var title: String!
    private(set) public var image: String!
    
    init(title: String, image: String){
        self.title = title
        self.image = image
    }
    
}

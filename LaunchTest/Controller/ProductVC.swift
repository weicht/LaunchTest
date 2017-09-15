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


class ProductVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var productTable: UITableView!
    var productsJson = JSON.null
    var products = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        productTable.dataSource = self
        productTable.delegate = self
        AuthService.instance.getProducts(callback: storeProducts)
    }
    
    func storeProducts(products: JSON?){
        self.products = [Product]()
        for (_, value) in products!["data"]["product"] {
            self.products.append( Product(title: value["name"].string!, image: value["avatar"].string!) )
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        self.productTable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell") as? ProductCell {
            let product = self.products[indexPath.row]
            cell.updateViews(product: product)
            return cell
        } else {
            return ProductCell()
        }
    }
    

}


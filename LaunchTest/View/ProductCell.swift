//
//  ProductCell.swift
//  LaunchTest
//
//  Created by Chris Weicht on 9/14/17.
//  Copyright © 2017 Chris Weicht. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func updateViews(product: Product){
        //TODO: find better way to crate UIImage...
        var base64String = product.image!
        if let range = base64String.range(of: "data:image/png;base64,", options: .regularExpression)  {
            base64String.removeSubrange(range)
        }
        if let range = base64String.range(of: "data:image/jpeg;base64,", options: .regularExpression)  {
            base64String.removeSubrange(range)
        }
        if let decodedData = Data(base64Encoded: base64String, options: .ignoreUnknownCharacters) {
            productImage.image = UIImage(data: decodedData)
        }
        productName.text = product.title
    }
}

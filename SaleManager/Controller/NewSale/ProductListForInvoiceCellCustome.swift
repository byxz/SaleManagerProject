//
//  ProductListForInvoiceCellCustome.swift
//  SaleManager
//
//  Created by Evgeniy Opryshko on 01/01/2019.
//  Copyright © 2019 com.sales.my. All rights reserved.
//

import Foundation
import UIKit

class NameProductListForInvoiceCellCustome: UITableViewCell {
    
    @IBOutlet var titel: UILabel!
    @IBOutlet var quantity: UILabel!
    @IBOutlet var price: UILabel!
    @IBOutlet var imageProduct: UIImageView!
    
    @IBOutlet weak var addProduct: UIButton!
    @IBOutlet weak var count: UILabel!
    
    func configureImage(dataImage: String) {
        if let imageURL = URL(string: dataImage) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        self.imageProduct.image = image
                        
                    }
                }
            }
        }
    }
    
}

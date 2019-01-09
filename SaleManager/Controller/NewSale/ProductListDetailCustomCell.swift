//
//  ProductListForBasketCustomCell.swift
//  SaleManager
//
//  Created by Nugumanov Dmitry on 1/2/19.
//  Copyright © 2019 com.sales.my. All rights reserved.
//

import UIKit

class ProductListDetailCustomCell: UITableViewCell {
    
    
    @IBOutlet weak var basketImageView: UIImageView!
    @IBOutlet weak var basketTitleLabel: UILabel!
    @IBOutlet weak var basketCountLabel: UILabel!
    
    @IBOutlet weak var basketPriceLabel: UILabel!
    
    
    @IBAction func basketCountPlusButtonTapped(_ sender: UIButton) {
        print("Hello")
    }
    
    @IBAction func basketCountMinusButtonTapped(_ sender: UIButton) {
        print("World")
    }
    
    func configureImage(dataImage: String) {
        if let imageURL = URL(string: dataImage) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        self.basketImageView.image = image
                    }
                }
            }
        }
    }
    
}


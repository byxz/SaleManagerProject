//
//  ViewController.swift
//  SaleManager
//
//  Created by Mac on 24.11.2018.
//  Copyright © 2018 com.sales.my. All rights reserved.
//

import UIKit
import Firebase

class ProductController: UIViewController {
    
    @IBOutlet var mainTable: UITableView!
    
    let worker = FireBaseWorker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        worker.getDataCatalog(tableView: mainTable)
        navigationItem.title = "Каталог"
        
    }
    
}


extension ProductController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return worker.catalog.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ProductCellCustom
        
        cell.productLabel.text = worker.catalog[indexPath.row].titel
        cell.priceLabel.text = worker.catalog[indexPath.row].price
        
        
        if let imageURL = URL(string: worker.catalog[indexPath.row].image) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.productImage.image = image
                        
                    }
                }
            }
        }
        
        return cell
    }
    
    
}


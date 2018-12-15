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
    let userID = Auth.auth().currentUser?.uid
    let ref = Database.database().reference(withPath: "catalog")
    
    var catalog = [MainBase]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func getData() {
        ref.observe(.value, with: { snapshot in
            var newItems: [MainBase] = []
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot,
                    let allItem = MainBase(snapshot: snapshot) {
                    newItems.append(allItem)
                }
            }
            self.catalog = newItems
            self.mainTable.reloadData()
        })
        
    }
    
}


extension ProductController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return catalog.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ProductCellCustom
        
        cell.productLabel.text = catalog[indexPath.row].titel
        cell.priceLabel.text = catalog[indexPath.row].price
        
        
        if let imageURL = URL(string: catalog[indexPath.row].image) {
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


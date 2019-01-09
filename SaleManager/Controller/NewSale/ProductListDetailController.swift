//
//  ProductListDetailController.swift
//  SaleManager
//
//  Created by Evgeniy Opryshko on 01/01/2019.
//  Copyright © 2019 com.sales.my. All rights reserved.
//

import Foundation
import UIKit

class ProductListDetailController: UITableViewController, CanRecieve {
    
    // MARK: Type declarations
    //struct/enum/class
    
    // MARK: Class variables/constants
    //static var/let
    
    // MARK: Interface outlets
    //@IBOutlets
    
    // MARK: Instance variables/constants
    //let/var
    var selectedProductList = [MainBase]()
    
    // MARK: Private instance variables/constants
    //private let/var
    
    // MARK: class functions
    //static func instantiateViewController() -> ViewController
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.customeStule(self.tableView)
       
    }
    
   
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
         print(selectedProductList)
    }
    
    
    //MARK: Configurations
    func recieveData(data: [MainBase]) {
        selectedProductList = data
    }
    
    //MARK: private funcs
    //private func myPrivateFunc()
    
    //MARK: Action funcs
    @IBAction func done(_ sender: Any) {
        navigationController?.dismiss(self.navigationController!)
    }
    
    //MARK: public funcs
    //func myPublicFunc()
    
    //MARK: AnyProtocol (ex. UITableViewDelegate)
    //func tableView(_ tableView: UITableView.....
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedProductList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasketCell", for: indexPath) as! ProductListDetailCustomCell
        
//        cell.textLabel?.text = selectedProductList[indexPath.row].titel
        cell.basketTitleLabel.text = selectedProductList[indexPath.row].titel
        cell.basketPriceLabel.text = selectedProductList[indexPath.row].price
        cell.configureImage(dataImage: selectedProductList[indexPath.row].image)
        
        return cell
    }
    
    //MARK: Any other protocol
    //func myFuncFromOtherProtocol()
    
    //MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Segue" {
            let dvc = segue.destination as! ProductListForInvoiceController
            dvc.delegate = self
        }
        
    }
    
    
    
    
    
}

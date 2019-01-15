//
//  FilterController.swift
//  SaleManager
//
//  Created by Evgeniy Opryshko on 02/01/2019.
//  Copyright © 2019 com.sales.my. All rights reserved.
//

import UIKit

class SalesFilterController: UITableViewController {
    
    // MARK: Interface outlets
    
    
    //MARK: UIViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.customeStule(self.tableView)
        
    }
    
    //MARK: AnyProtocol (ex. UITableViewDelegate)
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        switch (indexPath.section, indexPath.row) {
        case (0,0):
            cell.textLabel?.text = "Активные"
        case (0,1):
            cell.textLabel?.text = "Архив"
        case (1,0):
            cell.textLabel?.text = "Текущий месяц"
        case (1,1):
            cell.textLabel?.text = "Все"
        default:
            break
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
       
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    //MARK: Action funcs
    @IBAction func done(_ sender: Any) {
        navigationController?.dismiss(self.navigationController!)
    }
    
}

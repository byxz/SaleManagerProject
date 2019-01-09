//
//  ManagerAccountController.swift
//  SaleManager
//
//  Created by Evgeniy Opryshko on 09.12.2018.
//  Copyright © 2018 com.sales.my. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import Charts

class ManagerAccountController: UITableViewController {
    
    // MARK: Interface outlets
    
    @IBOutlet weak var chartView: BarChartView!
    
    // MARK: Instance variables/constants
    //let navigation = UINavigationController()
    let fireBaseWorker = FireBaseWorker()
    let chart = ChartController()
    
    // MARK: Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.tableFooterView = UIView()
        
        tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fireBaseWorker.chartDB()
        chartView.contentMode = .scaleAspectFit
        tableView.customeStule(self.tableView)
        
        //Black style navigation
        let backItem = UIBarButtonItem()
        backItem.title = " "
        navigationItem.backBarButtonItem = backItem
        navigationItem.title = "Кабинет менеджера"
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        chart.drawChart(chartView)
        
    }
    
    //MARK: Configurations
    
    
    
    
    
    //MARK: Action funcs
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        switch (indexPath.section, indexPath.row) {
        case (1,0):
            cell.textLabel?.text = "Создать накладную"
        case (1,1):
            cell.textLabel?.text = "Список продаж"
        case (1,2):
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
        case (2,0):
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
        default:
            print("Default")
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        
        switch (indexPath.section, indexPath.row) {
        case (1,0):
            transitionPushToViewController(name: "NewSaleController")
        case (1,1):
            transitionPushToViewController(name: "SalesListController")
        case (2,0):
            fireBaseWorker.signOut()
            
        default:
            print("Default")
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    // MARK: - Navigation
    
    
    
}

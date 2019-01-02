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
    let fireBaseWorker = FireBaseWorker()
    let chart = ChartController()
    
    // MARK: Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fireBaseWorker.chartDB()
        chartView.contentMode = .scaleAspectFit
        tableView.tableFooterView = UIView()
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

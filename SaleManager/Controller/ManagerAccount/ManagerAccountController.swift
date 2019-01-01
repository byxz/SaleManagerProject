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
    //let worker = FireBaseWorker()
    let fireBaseWorker = FireBaseWorker()
    let chart = ChartController()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //userCheck()
        fireBaseWorker.chartDB()
        chartView.contentMode = .scaleAspectFit
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //userCheck()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //userCheck()
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
            let storyboard = UIStoryboard(name: "NewSaleController", bundle: nil)
            let secondVC = storyboard.instantiateViewController(withIdentifier: "NewSaleController") as! NewSaleController
            self.navigationController?.pushViewController(secondVC, animated: true)
        case (1,1):
           transitionToViewController(name: "SalesListController")
        case (2,0):
            fireBaseWorker.signOut()
        default:
            print("Default")
        }
   
    }
    
    
    
    
    // MARK: - Navigation
    
    
    
}

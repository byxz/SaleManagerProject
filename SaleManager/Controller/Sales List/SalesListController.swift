//
//  SalesListController.swift
//  SaleManager
//
//  Created by Evgeniy Opryshko on 15.12.2018.
//  Copyright © 2018 com.sales.my. All rights reserved.
//

import Foundation
import UIKit

class SalesListController: UIViewController {
    
    // MARK: Interface outlets
    @IBOutlet var mainTable: UITableView!
    @IBOutlet weak var filter: UIBarButtonItem!
    
    // MARK: Instance variables/constants
    let worker = FireBaseWorker()
    //var sections = [TableSection<Int, Sales>]()
    
    
    //MARK: UIViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarController?.tabBar.isHidden = true
        worker.getDataSales(tableView: mainTable)
        
    }
    
    //MARK: Action funcs
    @IBAction func filterButton(_ sender: Any) {
    }
    
    //MARK: public funcs
    
}

extension SalesListController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return worker.sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = worker.sections[section]
        let invoiceNumber = section.sectionItem
        return "Накладная №\(invoiceNumber)"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = worker.sections[section]
        return section.rowItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SalesListCellCustome
        let section = worker.sections[indexPath.section]
        let headline = section.rowItems[indexPath.row]
        
        cell.invoiceNumber.text = "\(headline.invoiceNumber)"
        cell.city.text = headline.city
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .default, title: "Отменить") { (action, indexPath) in
            //TODO: make a question!
            self.worker.deletDataSales(indexPath: indexPath)
            tableView.reloadData()
        }
        let archive = UITableViewRowAction(style: .default, title: "В архив") { (action, indexPath) in
            //TODO: make a question!
            print("В архив")
        }
        
        
        delete.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        archive.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        return [delete,archive]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let indexPath = indexPath
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "InformationSegue" {
            if let indexPath = mainTable.indexPathForSelectedRow {
                let dvc = segue.destination as! SalesInformationController
                dvc.item = [worker.sales[indexPath.row]]
            }
        }
    }
}

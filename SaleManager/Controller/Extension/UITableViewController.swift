//
//  UITableViewController.swift
//  SaleManager
//
//  Created by Evgeniy Opryshko on 02/01/2019.
//  Copyright © 2019 com.sales.my. All rights reserved.
//

import UIKit

extension UITableView {
    
    func customeStule(_ tableView: UITableView) {
        tableView.backgroundColor = #colorLiteral(red: 0.9371530414, green: 0.9373135567, blue: 0.9371429086, alpha: 1)
        tableView.tableFooterView = UIView(frame: .zero)
    }
}

//
//  Extension.swift
//  SaleManager
//
//  Created by Nugumanov Dmitry on 12/17/18.
//  Copyright © 2018 com.sales.my. All rights reserved.
//

import UIKit

extension UIViewController {
    
    /// Transition to other ViewController with name or ID
    ///
    /// - Parameters:
    ///   - viewcontroller: This parameter must specify the name of the ViewController before proceeding..
    
    
    func transitionToViewController(name viewcontroller: String) {
        var myViewController: UIViewController!
        let storyboard = UIStoryboard(name: viewcontroller, bundle: nil)
        myViewController = storyboard.instantiateViewController(withIdentifier: viewcontroller)
        present(myViewController, animated: true, completion: nil)
    }
    
    func transitionPushToViewController(name viewcontroller: String) {
        let storyboard = UIStoryboard(name: viewcontroller, bundle: nil)
        let secondVC = storyboard.instantiateViewController(withIdentifier: viewcontroller)
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
}

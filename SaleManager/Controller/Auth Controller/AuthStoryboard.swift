//
//  AuthStoryboard.swift
//  SaleManager
//
//  Created by Mac on 08.12.2018.
//  Copyright © 2018 com.sales.my. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class AuthStoryboard: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userCheck()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       userCheck()
    }
    
    
    @IBAction func disMiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func continueAsGuest(_ sender: Any) {
        dismiss(animated: true) {
        }
    }
    
    func userCheck() {
        Auth.auth().addStateDidChangeListener() { auth, user in
            if user != nil {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
}

//
//  ManagerAccountController.swift
//  SaleManager
//
//  Created by Mac on 09.12.2018.
//  Copyright © 2018 com.sales.my. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class ManagerAccountController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userCheck()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //userCheck()
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        userCheck()
    }
    
    
    @IBAction func SaleList(_ sender: Any) {
        var myViewController: UIViewController!
        let storyboard = UIStoryboard(name: "SalesListController", bundle: nil)
        myViewController = storyboard.instantiateViewController(withIdentifier: "SalesListController")
        self.present(myViewController, animated: true, completion: nil)
    }
    @IBAction func NewSale(_ sender: Any) {
        var myViewController: UIViewController!
        let storyboard = UIStoryboard(name: "NewSaleController", bundle: nil)
        myViewController = storyboard.instantiateViewController(withIdentifier: "NewSaleController")
        self.present(myViewController, animated: true, completion: nil)
    }
    @IBAction func signOutButton(_ sender: Any) {
        signOut()
    }
    func signOut() {
        do {
            try Auth.auth().signOut()
            Status.shared.loginStatus = false
            
            var myViewController: UIViewController!
            let storyboard = UIStoryboard(name: "AuthStoryboard", bundle: nil)
            myViewController = storyboard.instantiateViewController(withIdentifier: "AuthStoryboard")
            self.present(myViewController, animated: true, completion: nil)
            
        } catch (let error) {
            print("Auth sign out failed: \(error)")
        }
    }
    
    func userCheck() {
        //Auth.auth().addStateDidChangeListener() { auth, user in
        if Status.shared.loginStatus {
            print("MyAccount Логин получен")
        } else {
            print("MyAccount Пользователя с таким логином нет, идем на регистрацию")
            var myViewController: UIViewController!
            let storyboard = UIStoryboard(name: "AuthStoryboard", bundle: nil)
            myViewController = storyboard.instantiateViewController(withIdentifier: "AuthStoryboard")
            self.present(myViewController, animated: true, completion: nil)
            
        }
    }
    
}

//
//  MyAccountController.swift
//  SaleManager
//
//  Created by Mac on 08.12.2018.
//  Copyright © 2018 com.sales.my. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class MyAccountController: UIViewController {
    
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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    
   
    
    @IBAction func singOut(_ sender: Any) {
        signOut()
        
    }
    
    func userCheckDELET() {
        Auth.auth().addStateDidChangeListener() { auth, user in
            if user != nil {
                print("Логин получен")
            } else {
                print("Пользователя с таким логином нет, идем на регистрацию")
                var myViewController: UIViewController!
                let storyboard = UIStoryboard(name: "AuthStoryboard", bundle: nil)
                myViewController = storyboard.instantiateViewController(withIdentifier: "AuthStoryboard")
                self.present(myViewController, animated: true, completion: nil)
            }
            if let user = user {
                if user.email == "test@gmail.com" {
                    print("admin")
                }
            }
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
    
    func signOut() {
        do {
            try Auth.auth().signOut()
           Status.shared.loginStatus = false
            
            //GO TO the FIRST CONTROLLER
        } catch (let error) {
            print("Auth sign out failed: \(error)")
        }
    }
    
}

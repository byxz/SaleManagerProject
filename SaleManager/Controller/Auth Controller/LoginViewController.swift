//
//  ViewController.swift
//  SalaManager
//
//  Created by Nugumanov Dmitry on 11/24/18.
//  Copyright © 2018 Nugumanov Dmitry. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        emailTextField.text = ""
        passwordTextField.text = ""
    }
    
    
    
    func kbDidShow(notification: Notification) {
    }
    func kbDidHide(notification: Notification) {
    }
    
    
    
    @IBAction func loginTapped(_ sender: UIButton) {
        guard let email = emailTextField.text, let password = passwordTextField.text, email != "", password != "" else {
            return print("Пусто")
        }
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil {
                print("Error login")
            }
            if user != nil {
                self.dismiss(animated: true, completion: nil)
                Status.shared.loginStatus = true
                print("OK")
            }
        }
    }
    
    @IBAction func JoinTapped(_ sender: UIButton) {
    }
    
}


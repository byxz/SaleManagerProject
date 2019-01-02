//
//  TestViewController.swift
//  SalaManager
//
//  Created by Nugumanov Dmitry on 11/26/18.
//  Copyright © 2018 Nugumanov Dmitry. All rights reserved.
//

import Foundation
import Firebase

class RegisterViewController: UIViewController {
    
    //var ref: DatabaseReference!
    //let worker = NetValidator()
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    func showAlert(_ text: String) {
        let alertController = UIAlertController(title: "Warning", message: text, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel)
        alertController.addAction(action)
        showDetailViewController(alertController, sender: nil)
    }
    
    // Registration User
    @IBAction func continueTapped(_ sender: UIButton) {
        check()
    }
    
    @IBAction func openLoginViewTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
    }
    
    
    
    // cancellation of registration and return to the previous screen
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    // Validation of input data for matching string fields
    func check() {
        guard let userEmail = emailTextField.text, let userPassword = passwordTextField.text, let userName = nameTextField.text, userEmail != "", userPassword != "", userName != "" else {
            showAlert( "Fill in all the fields")
            print("Fill in all the fields")
            return
        }
      
                        Auth.auth().createUser(withEmail: userEmail, password: userPassword, completion: { (user, error) in
                            guard error == nil, user != nil else {
                                print(error!.localizedDescription)
                                return
                            }
                           // let userRef = self?.ref.child((user?.user.uid)!)
                            //userRef?.setValue(["user": user?.user.email])
                        })
                        // Возврат на главное окно после регистрации
                        self.dismiss(animated: true, completion: nil)
        
        
        
            
        
    }
}



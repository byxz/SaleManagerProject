//
//  Main.swift
//  SaleManager
//
//  Created by Evgeniy Opryshko on 01/01/2019.
//  Copyright © 2019 com.sales.my. All rights reserved.
//

import UIKit
import Firebase

class Main: UIViewController {
    
     // MARK: Class variables/constants
    
    let tabBarCnt = UITabBarController()
    lazy var worker = FireBaseWorker()
    
    //MARK: UIViewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTabBarController()
        
    }
    
    //MARK: Configurations
    
    func createTabBarController() {
        
        let product = createNavController(controller: Controller.init(storyboard: "ProductController", identifier: "ProductController", image: "shopping", selectedImage: "shoppingSelected"))
        
        let manager = createNavController(controller: Controller.init(storyboard: "ManagerAccountController", identifier: "ManagerAccountController", image: "profile", selectedImage: "profileSelected"))
        
        let login = createNavController(controller: Controller.init(storyboard: "AuthStoryboard", identifier: "LoginViewController", image: "profile", selectedImage: "profileSelected"))
        
        Auth.auth().addStateDidChangeListener() { auth, user in
    
            if let user = user {
                if user.email == "user@i.ua" {
                    let controllerArray = [product, manager]
                    self.tabBarCnt.viewControllers = controllerArray.map{ UINavigationController.init(rootViewController: $0)}
                    print("controllerArray = [product, manager]")
                }
            } else {
                let controllerArray = [product, login]
                print("controllerArray = [product, login]")
                self.tabBarCnt.viewControllers = controllerArray.map{ UINavigationController.init(rootViewController: $0)}
            }
            
            
        }
        
        self.view.addSubview(tabBarCnt.view)
    }
    
    func createNavController(controller:Controller) -> UIViewController {
        
        var viewController = UIViewController()
        let storyboard = UIStoryboard(name: controller.storyboard, bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: controller.identifier)
        viewController.tabBarItem.image = UIImage(named: controller.image)?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        viewController.tabBarItem.selectedImage = UIImage(named: controller.selectedImage)?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        viewController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        return viewController
    }
    
}

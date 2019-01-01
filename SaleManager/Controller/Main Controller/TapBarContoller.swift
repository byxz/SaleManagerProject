

import UIKit
import Firebase

class TapBarContoller: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userCheck()
        
        self.delegate = self
        selectedIndex = 0
        
        let productController = setupTabBarElement(StoryboardName: "ProductController", Identifier: "ProductController", titel: "Каталог", image: "profile")
        
        let myAccountController = setupTabBarElement(StoryboardName: "ManagerAccountController", Identifier: "ManagerAccountController", titel: "Мой аккаунт", image: "profile")
        
        viewControllers = [productController,myAccountController]
        
        let myTabBarItem1 = (self.tabBar.items?[0])! as UITabBarItem
        myTabBarItem1.image = UIImage(named: "shopping")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem1.selectedImage = UIImage(named: "shoppingSelected")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        //myTabBarItem1.title = "Каталог"
        myTabBarItem1.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        let myTabBarItem2 = (self.tabBar.items?[1])! as UITabBarItem
        myTabBarItem2.image = UIImage(named: "profile")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem2.selectedImage = UIImage(named: "profileSelected")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        //myTabBarItem2.title = "Профиль"
        myTabBarItem2.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userCheck()
        selectedIndex = 0
    }
    
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
    }
    
    
    
    func userCheck() {
        Auth.auth().addStateDidChangeListener() { auth, user in
            if user != nil {
                Status.shared.loginStatus = true
                print("TabBar Логин получен")
                //print(self.loginStatus.loginStatus)
            } else {
                print("TabBar Пользователя с таким логином нет, идем на регистрацию")
                //print(self.loginStatus.loginStatus)
//                var myViewController: UIViewController!
//                let storyboard = UIStoryboard(name: "AuthStoryboard", bundle: nil)
//                myViewController = storyboard.instantiateViewController(withIdentifier: "AuthStoryboard")
//                self.present(myViewController, animated: true, completion: nil)
            }
            if let user = user {
                if user.email == "test@gmail.com" {
                    print("admin")
                }
            }
        }
    }
    
    
    func setupTabBarElement(StoryboardName: String, Identifier: String, titel: String, image: String) -> UIViewController {
        var myViewController: UIViewController!
        
        
        let storyboard = UIStoryboard(name: StoryboardName, bundle: nil)
        myViewController = storyboard.instantiateViewController(withIdentifier: Identifier)
        
        return myViewController
    }
    
    
    
}



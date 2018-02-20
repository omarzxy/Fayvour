//
//  loginDetailViewController.swift
//  Favour
//
//  Created by Omar Ali,Mohamud on 2018-02-16.
//  Copyright © 2018 Omar Ali Mohamud. All rights reserved.
//

import UIKit
import Firebase

class loginDetailViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
   
    @IBAction func loginButtonTouched(_ sender: Any) {
        
        if let loadingButton = loginButton as? LoadingButton {
            loadingButton.showLoading()
            print("casting ok")
            
            
        }
        
        loginWithCredentials(emailTextField.text!, pass:passwordTextField.text! )
        print("function called")
        
    }
    
    
    
    
    
    
    
    
    
    func loginWithCredentials(_ username: String, pass:String) {
        Auth.auth().signIn(withEmail: username, password: pass, completion: { (user, error) in
            if(error == nil){
                // Success, logging in with email
                
              self.performSegue(withIdentifier: "loginDetailToTabBar", sender: nil)
                
            } else{
                // 2 POSSIBILITIES: (1) Account doesn't exist  (2) Account exists, password was incorrect
                
                if let loadingButton = self.loginButton as? LoadingButton {
                    loadingButton.hideLoading()
                    
                    
                    
                }
                
                
            }
        })
    }
    
    func loginErrorAlert(title: String, message: String) {
        
        // Called upon login error to let the user know login didn't work.
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

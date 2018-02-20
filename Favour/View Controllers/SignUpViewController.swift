//
//  SignUpViewController.swift
//  Favour
//
//  Created by Omar Ali,Mohamud on 2018-02-09.
//  Copyright © 2018 Omar Ali Mohamud. All rights reserved.
//

import UIKit
import Firebase
class SignUpViewController: UIViewController {

    @IBOutlet weak var userDisplayName: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    var user = [String:String?]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func createAccount(_ sender: Any) {
        
        
        user = ["displayName":userDisplayName.text!,"email":emailTextField.text!,"password":passwordTextField.text!]
        loginUser()
        
        
        
        
    }
    
    
    
    
    
    func loginUser() {
        
        Auth.auth().createUser(withEmail: user["email"] as! String, password: user["password"] as! String, completion: { (UserFromClosure, error) in
            
            
            let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
            changeRequest?.displayName = self.user["displayName"]!
            changeRequest?.commitChanges { (error) in
                // ...
            }
            
            
            
            
        })
        
        self.performSegue(withIdentifier: "signUpToTabBar", sender: nil)
        
        
        
        
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

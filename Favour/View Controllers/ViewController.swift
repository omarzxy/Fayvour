//
//  ViewController.swift
//  Favour
//
//  Created by Omar Ali,Mohamud on 2018-01-09.
//  Copyright © 2018 Omar Ali Mohamud. All rights reserved.
//

import UIKit

import Firebase


class ViewController: UIViewController {
    var backGroundPicture = String()
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var passWordTextField: UITextField!
    
    
    @IBOutlet weak var favorLabel: UILabel!
    @IBOutlet var backGroundImage: UIImageView!
    @IBOutlet weak var needSomethingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("rutherford") {
                backGroundImage.image = UIImage(named: item)
                backGroundImage.alpha = 1
                
                
            }
        }
        
        //favorLabel.alpha = 1
        //needSomethingLabel.alpha = 1
        backGroundImage.tintColor = UIColor(named: "Black")
        
       
      
        
    }
    
    
    
    
    
    
        
    @IBAction func loginButtonTouched(_ sender: Any) {
        
        activityIndicator.startAnimating()
//
//        activity.color = UIColor(named: "Black")
//
        loginWithCredentials(emailTextField.text!, pass:passWordTextField.text! )

        
        
        }

        
        
        
    
    
    


func loginWithCredentials(_ username: String, pass:String){
    Auth.auth().signIn(withEmail: username, password: pass, completion: { (user, error) in
        if(error == nil){
            // Success, logging in with email
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Feed")
            
            
        } else{
            // 2 POSSIBILITIES: (1) Account doesn't exist  (2) Account exists, password was incorrect
            Auth.auth().createUser(withEmail: username, password: pass, completion: { (user, error) in
                if(error == nil){
                    // Success, created account, logging in now
                    Fire.shared.newUser(user!, completionHandler: { (success) in
                        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Feed")
                        self.activityIndicator.stopAnimating()
                    })
                } else{
                    let errorMessage = "Account exists but password is incorrect"
                    let alert = UIAlertController(title: username, message: errorMessage, preferredStyle: .alert)
                    let action1 = UIAlertAction.init(title: "Try Again", style: .default, handler: nil)
                    let action2 = UIAlertAction.init(title: "Send a password-reset email", style: .destructive, handler: { (action) in
                        Auth.auth().sendPasswordReset(withEmail: username) { error in
                            if error == nil{
                                // Password reset email sent.
                                let alert = UIAlertController(title: "Email Sent", message: nil, preferredStyle: .alert)
                                let action1 = UIAlertAction.init(title: "Okay", style: .default, handler: nil)
                                alert.addAction(action1)
                                self.present(alert, animated: true, completion: nil)
                            } else{
                                let alert = UIAlertController(title: "Error sending email", message: error!.localizedDescription, preferredStyle: .alert)
                                let action1 = UIAlertAction.init(title: "Okay", style: .default, handler: nil)
                                alert.addAction(action1)
                                self.present(alert, animated: true, completion: nil)
                            }
                        }
                    })
                    alert.addAction(action1)
                    alert.addAction(action2)
                    self.present(alert, animated: true, completion: nil)
                }
            })
        }
    })
    }



        // Do any additional setup after loading the view, typically from a nib.
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


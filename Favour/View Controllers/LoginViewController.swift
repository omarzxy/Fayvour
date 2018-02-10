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
    
    
    @IBAction func signUp(_ sender: Any) {
    }
    
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
        
        
        if Auth.auth().currentUser != nil{
            self.performSegue(withIdentifier: "loginToFeed", sender: nil)
            
        }
       
      
        
    }
    
    
    
    
    
    
    
    @IBAction func cancelToLoginViewController(_ segue: UIStoryboardSegue) {
        
    }
    
    
    @IBAction func saveUserDetail(_ segue: UIStoryboardSegue) {
        
        
        
    }
    
    
    
        
    @IBAction func loginButtonTouched(_ sender: Any) {
        
        
//
//        activity.color = UIColor(named: "Black")
//
        loginWithCredentials(emailTextField.text!, pass:passWordTextField.text! )

        
        
        }

        
        
        
    
    
    


func loginWithCredentials(_ username: String, pass:String) {
    Auth.auth().signIn(withEmail: username, password: pass, completion: { (user, error) in
        if(error == nil){
            // Success, logging in with email
          
            self.performSegue(withIdentifier: "loginToFeed", sender: nil)
            
            
        } else{
            // 2 POSSIBILITIES: (1) Account doesn't exist  (2) Account exists, password was incorrect
            
            
            
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
    


        // Do any additional setup after loading the view, typically from a nib.
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


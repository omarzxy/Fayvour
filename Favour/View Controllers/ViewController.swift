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
    
    @IBOutlet weak var loginTextField: UITextField!
    
    
    
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
//        if loginTextField?.text != "" { // 1
//            Auth.auth().signInAnonymously(completion: { (user, error) in // 2
//                if let err = error { // 3
//                    print(err.localizedDescription)
//                    return
//                }
//                
//                self.performSegue(withIdentifier: "LoginToFeed", sender: nil) // 4
//            })
//        }
//        
        
        
        
    }
    
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


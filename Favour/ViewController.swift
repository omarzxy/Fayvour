//
//  ViewController.swift
//  Favour
//
//  Created by Omar Ali,Mohamud on 2018-01-09.
//  Copyright © 2018 Omar Ali Mohamud. All rights reserved.
//

import UIKit
import FacebookLogin


class ViewController: UIViewController {
    var backGroundPicture = String()
    
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
        
       
        
      
        let loginButton = LoginButton(readPermissions: [ .publicProfile ])
        loginButton.center = view.center
            
        backGroundImage.addSubview(loginButton)
        
        
        
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


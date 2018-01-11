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
        
       
        
      
        let facebookLoginButton = LoginButton(readPermissions: [ .publicProfile ])
        facebookLoginButton.center = view.center
            
        backGroundImage.addSubview(facebookLoginButton)
      
            let skipButton = UIButton(frame: CGRect(x: 150, y: 400, width: 200, height: 20))
           /* skipButton.widthAnchor.constraint(equalTo: facebookLoginButton.widthAnchor, multiplier: 1).isActive = true
            skipButton.heightAnchor.constraint(equalTo: facebookLoginButton.heightAnchor, multiplier: 1).isActive = true
            skipButton.topAnchor.constraint(equalTo: facebookLoginButton.bottomAnchor).isActive = true
            skipButton.alpha = 0 */
            skipButton.setTitle("Skip", for: .normal )
            skipButton.setTitleColor(UIColor.black, for: .normal)
            skipButton.backgroundColor = UIColor.white
            skipButton.showsTouchWhenHighlighted = true
            skipButton.addTarget(self, action: #selector(click), for: .touchUpInside)
            view.addSubview(skipButton)
        
    }
    
       
     @objc func click(sender:UIButton) {
        
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Feed") as? Feed {
          
            if  let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
      
        
    
        
        
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


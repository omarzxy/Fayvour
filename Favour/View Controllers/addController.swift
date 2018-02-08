//
//  addController.swift
//  Favour
//
//  Created by Omar Ali,Mohamud on 2018-01-23.
//  Copyright © 2018 Omar Ali Mohamud. All rights reserved.
//

import UIKit

class addController: UITableViewController {
    @IBOutlet weak var postTitle: UITextField!
    
    @IBOutlet weak var costOfPost: UITextField!
    
    @IBOutlet weak var detailPost: UITextView!
    
    
    var post = PostModel(title: "postTitle", cost: "costOfPost.text", postString: "detailPost")
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)  {
        if segue.identifier == "SavePostDetail"  {
            post = PostModel(title: postTitle.text, cost: costOfPost.text, postString: detailPost.text)
            
            
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    @IBAction func shareLocation(_ sender: Any) {
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        if indexPath.section == 0 {
            postTitle.becomeFirstResponder()
        } else if indexPath.section == 2 {
            detailPost.becomeFirstResponder()
        }else if indexPath.section == 1 {
            costOfPost.becomeFirstResponder()
        }
        
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


}

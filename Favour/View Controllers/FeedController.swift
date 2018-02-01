//
//  Feed.swift
//  Favour
//
//  Created by Omar Ali,Mohamud on 2018-01-09.
//  Copyright © 2018 Omar Ali Mohamud. All rights reserved.
//

import UIKit

class FeedController: UITableViewController {
    
    var posts = [PostModel]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 250
        
        
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationItem.title  = "FEED"
        navigationController?.navigationItem.titleView?.backgroundColor = UIColor(named: "Blue")
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
   /* @IBAction func addPost(_ sender: Any) {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "addController") as? addController {
            
            if  let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
           
        }
        
        
        
        
        
    } */
    
    @IBAction func cancelToFeedViewController(_ segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func savePostDetail(_ segue: UIStoryboardSegue) {
       
        guard let addController = segue.source as? addController
                                else {
                return
        }
        
        // add the new player to the players array
      
        let post = addController.post
        
        posts.append(post)
        
        // update the tableView
        let indexPath = IndexPath(row: posts.count - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailFeed") as? DetailFeedViewController {
            
            for view in view.subviews {
                if view.tag == 0 {
                    
                    
                    
                }
            }
            
            
        }
        
        
    }
   

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Posts
        cell.moneyLabel.text = posts[indexPath.row].cost
        cell.postLabel.text = posts[indexPath.row].postString
        cell.nameLabel.text = posts[indexPath.row].title
        
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("avatar") {
                cell.profilePic.image = UIImage(named: item)
                cell.profilePic.layer.borderColor = UIColor(named: "black")?.cgColor
                cell.profilePic.layer.borderWidth = CGFloat(integerLiteral: 2)
                cell.profilePic.layer.cornerRadius = cell.profilePic.bounds.width/2
                cell.profilePic.layer.masksToBounds = true
                
                
                
            }
            
        
            
        }
       
        
        
        
        return cell
    }
    
    
    // MARK: - Table view data source
}

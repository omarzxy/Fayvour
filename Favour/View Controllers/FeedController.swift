//
//  Feed.swift
//  Favour
//
//  Created by Omar Ali,Mohamud on 2018-01-09.
//  Copyright © 2018 Omar Ali Mohamud. All rights reserved.
//

import UIKit
import Firebase
class FeedController: UITableViewController  {
   
    
    
    var ref: DatabaseReference!
    
   
    
    var user : String?
    var posts = [PostModel]()
    let searchController = UISearchController(searchResultsController: nil)
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 250
    
        ref = Database.database().reference().child("posts")
        
        
        let refHandle = ref.observe(DataEventType.childAdded, with: { (snapshot) in
            let postDict = snapshot.value as? [String : AnyObject] ?? [:]
            print(postDict)
            
            let post = PostModel(title: postDict["Title"] as? String, cost: postDict["Cost"] as? String, postString: postDict["PostString"] as? String)
            
            self.posts.append(post)
            self.tableView.reloadData()
           
                
            
            // ...
            
            
            
            
        })


   


       
        
        
    }
    
    
    func getPosts() {
        
        Fire.shared.getData("posts", completionHandler: {(AnyPost) in
            
            switch Fire.shared.typeOf(FirebaseData: AnyPost) {
            case .isArray:
                for post in AnyPost as! [String]{
                    print(post)
                }
                
                
                
            case .isDictionary:
                print("is dictionary")
                if  let dataDict = AnyPost as? [String:String] {
                    print(dataDict["Cost"])
                }
                
                
                
            default:
                print("default")
                // DATA is a leaf node
            }
            
        })
        

        
        
        
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBAction func cancelToFeedViewController(_ segue: UIStoryboardSegue) {
        
    }
    
    
    @IBAction func savePostDetail(_ segue: UIStoryboardSegue) {
       
        guard let addController = segue.source as? addController
                                else {
                return
        }
        
        // add the new player to the players array
      
        var post = addController.post
        let dict = ["Title": post.title ,"Cost": post.cost ,"PostString": post.postString]
        
       Fire.shared.addData(dict, asChildAt: "posts", completionHandler: { (sucess,id,ref) in
        
//        if sucess {
//            post.ref = ref
//
//
//        }
        

        })
        
        posts.append(post)
        // update the tableView
        let indexPath = IndexPath(row: posts.count - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailFeed") as? DetailFeedViewController {
//
//            for view in view.subviews {
//                if view.tag == 0 {
//
//
//
//                }
//            }
//
//
    //    }
        
        
    }
   

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Posts
        
        
        
        
        
        cell.moneyLabel.text = posts[indexPath.row].cost
        cell.postLabel.text = posts[indexPath.row].postString
        cell.nameLabel.text = posts[indexPath.row].title
        cell.nameLabel.highlightedTextColor = UIColor.black
        
        
        
        
        
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

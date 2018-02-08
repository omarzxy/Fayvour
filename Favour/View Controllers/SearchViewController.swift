//
//  SearchViewController.swift
//  Favour
//
//  Created by Omar Ali,Mohamud on 2018-02-07.
//  Copyright © 2018 Omar Ali Mohamud. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController,UISearchResultsUpdating, UITableViewDataSource,UITableViewDelegate{
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       return  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    }
    
    
    
    
    
    
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    let searchController = UISearchController(searchResultsController: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        
        searchController.searchBar.sizeToFit()
        searchController.searchBar.sizeToFit()
        searchController.searchBar.barStyle = UIBarStyle.black
        searchController.searchBar.barTintColor = UIColor.white
        searchController.searchBar.backgroundColor = UIColor.clear
        tableView.tableHeaderView = searchController.searchBar
        
        
        // Do any additional setup after loading the view.
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

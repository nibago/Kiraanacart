//
//  ListOfStoresViewController.swift
//  Kiraanacart
//
//  Created by CHINNA on 11/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit

class ListOfStoresViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchResultsUpdating {
    
    let entries = [(title: "Balaji Super Market", image: "image1"),
                   (title: "Modern Foods", image: "image2"),
                   (title: "GrandModern Super Market", image: "image3"),
                   (title: "Reliance Fresh", image: "image4"),
                   (title: "Modern Foods", image: "image5"),
                   (title: "Family Rice Mall", image: "image6"),
                   (title: "MODERN MART", image: "image7"),
                   (title: "More Supermarket", image: "image8"),
                   (title: "Padmavathi Super Market", image: "image9"),
                   (title: "Subhiksha Super market", image: "image10"),
                   
    ]
    
    var searchResults : [(title: String, image: String)] = []
    
    let searchController = UISearchController(searchResultsController: nil)
    
    @IBOutlet weak var TableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if #available(iOS 13.0, *) {
            // Always adopt a light interface style.
            overrideUserInterfaceStyle = .light
        }
        
        searchController.searchResultsUpdater = self
        self.definesPresentationContext = true
        
        // Place the search bar in the navigation item's title view.
        self.navigationItem.titleView = searchController.searchBar
        
        // Don't hide the navigation bar because the search bar is in it.
        searchController.hidesNavigationBarDuringPresentation = false
        
        //        addSearchbar()
        
        //  addPultoRefresh()
        
    }
    
    func addPultoRefresh()
    {
        
        self.TableView.es.addPullToRefresh {
            [unowned self] in
            /// Do anything you want...
            self.TableView.es.addPullToRefresh {
                [unowned self] in
                /// Do anything you want...
                /// ...
                
                self.TableView.reloadData()
                /// Stop refresh when your job finished, it will reset refresh footer if completion is true
                self.TableView.es.stopPullToRefresh()
            }
        }
    }
    
    
    @IBAction func segmentedControlButtonClickAction(_ sender: UISegmentedControl) {
       if sender.selectedSegmentIndex == 0 {
          print("First Segment Select")
       }
       else {
          print("Second Segment Select")
       }
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return imageofArray.count
        return searchController.isActive ? searchResults.count : entries.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        let entry = searchController.isActive ?
            searchResults[indexPath.row] : entries[indexPath.row]
        
        cell.CustomView.layer.borderWidth = 1
        cell.CustomView.layer.cornerRadius = 3
        cell.CustomView.layer.masksToBounds = true
        cell.CustomView.layer.borderColor = UIColor(red:205.0/255.0, green:205.0/255.0, blue:205.0/255.0, alpha: 1.0).cgColor
        cell.ratingLabel.layer.cornerRadius = 1.0
        cell.ratingLabel.layer.masksToBounds = true
        cell.nameOfsupermarket.text = entry.title
        cell.storeImage.image = UIImage(named: entry.image)
        cell.selectionStyle = .none
        
        return cell
    }
    
    func filterContent(for searchText: String) {
        // Update the searchResults array with matches
        // in our entries based on the title value.
        searchResults = entries.filter({ (title: String, image: String) -> Bool in
            let match = title.range(of: searchText, options: .caseInsensitive)
            // Return the tuple if the range contains a match.
            return match != nil
        })
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
        // If the search bar contains text, filter our data with the string
        if let searchText = searchController.searchBar.text {
            filterContent(for: searchText)
            // Reload the table view with the search result data.
            TableView.reloadData()
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt
        indexPath: IndexPath){
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "ShopbyStoryboard", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "shopbyprViewController") as! shopbyprViewController
        self.navigationController?.show(nextViewController, sender: true)
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Show the navigation bar on other view controllers
        
        self.tabBarController?.tabBar.isHidden = false
    }
    
    
}

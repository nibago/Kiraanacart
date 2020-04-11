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
    
//    let imageofArray  = ["image1","image2","image3","image4","image5","image6","image7","image8","image9","image10","image11","image12"]
    
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
        let row = indexPath.row
       
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
    
//
//    func addSearchbar(){
//            if #available(iOS 11.0, *) {
//                let sc = UISearchController(searchResultsController: nil)
//                let scb = sc.searchBar
//                scb.tintColor = UIColor.white
//                scb.searchTextField.attributedPlaceholder = NSAttributedString(string: "Enter Search Here", attributes: [NSAttributedString.Key.foregroundColor :Constants.BM_MainColor ])
//
//                if let navigationbar = self.navigationController?.navigationBar {
//                    navigationbar.barTintColor = Constants.BM_MainColor
//                  }
//
//                navigationController?.navigationBar.tintColor = UIColor.white
//                navigationItem.searchController = sc
//                navigationItem.hidesSearchBarWhenScrolling = false
//            }
//    }

}

//
//  FriendsController.swift
//  vk standalone app
//
//  Created by Sergey Kosov on 20/08/2019.
//  Copyright © 2019 Kosov Sergey. All rights reserved.
//

import UIKit


class FriendsController: UITableViewController {
    
    let searchController = UISearchController ( searchResultsController: nil )
    
    let entries = [(title: "Kimi Raikkonen", image: "KimiRaikkonen"),
                   (title: "Lewis Hamilton", image: "LewisHamilton"),
                   (title: "Max Verstappen", image: "MaxVerstappen"),
                   (title: "Robert Kubica", image: "RobertKubica"),
                   (title: "Sebastian Vettel", image: "SebastianVettel"),
                   (title: "Valtteri Bottas", image: "ValtteriBottas"),
                   (title: "George Russell", image: "GeorgeRussell")]
    
    var searchResults : [(title: String, image: String)] = []
    
    let friends = User.getFriends()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self as? UISearchResultsUpdating
        self.definesPresentationContext = true
        
        // Place the search bar in the table view's header.
        self.tableView.tableHeaderView = searchController.searchBar
        
        // Set the content offset to the height of the search bar's height
        // to hide it when the view is first presented.
        self.tableView.contentOffset = CGPoint(x: 0, y: searchController.searchBar.frame.height)
        
    }
    
    // MARK: - UISearchResultsUpdating method
    
    func updateSearchResults(for searchController: UISearchController) {
        // If the search bar contains text, filter our data with the string
        if let searchText = searchController.searchBar.text {
            filterContent(for: searchText)
            // Reload the table view with the search result data.
            tableView.reloadData()
        }
    }
    
    // MARK: - UITableViewController methods
    
    override func numberOfSections(in tableView: UITableView) -> Int { return 1 }
    
    
    
    func filterContent(for searchText: String) {
        // Update the searchResults array with matches
        // in our entries based on the title value.
        searchResults = entries.filter({ (title: String, image: String) -> Bool in
            let match = title.range(of: searchText, options: .caseInsensitive)
            // Return the tuple if the range contains a match.
            return match != nil
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
        return searchController.isActive ? searchResults.count : entries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as! FriendsCell
        
        
        let friend = friends[indexPath.row]
        
        _ = searchController.isActive ?
            searchResults[indexPath.row] : entries[indexPath.row]
        
        cell.userNameLabel.text = "\(friend.firstName) \(friend.lastName)"
        
        if friend.avatar == nil {
            cell.avatarView.userAvatarView.image = UIImage(named: "default")
            
        } else {
            cell.avatarView.userAvatarView.image = friend.avatar
        }
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "FriendsPhotoSegue",
            let _ = tableView.indexPathForSelectedRow,
            let _ = segue.destination as? FriendsPhotoController {
            
            // let photos = friends[indexPath.row].photos
            //photoVC.photos = photos
        }
    }
    
    
    
}



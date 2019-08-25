//
//  FriendsController.swift
//  vk standalone app
//
//  Created by Sergey Kosov on 20/08/2019.
//  Copyright © 2019 Kosov Sergey. All rights reserved.
//

import UIKit


class FriendsController: UITableViewController {
    
    
    let friends = User.getFriends()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as! FriendsCell
        
        let friend = friends[indexPath.row]
        
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



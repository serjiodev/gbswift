//
//  AllGroupsController.swift
//  vk standalone app
//
//  Created by Sergey Kosov on 20/08/2019.
//  Copyright © 2019 Kosov Sergey. All rights reserved.
//

import UIKit

class AllGroupsController: UITableViewController {
    
    var groupNames = [
        Group(name: "Williams", avatar: UIImage(named: "Williams")),
        Group(name: "Ferrari", avatar: UIImage(named: "Ferrari")),
        Group(name: "Red Bull Racing", avatar: UIImage(named: "RedBullRacing")),
        Group(name: "Mercedes", avatar: UIImage(named: "Mercedes")),
        Group(name: "Alfa Romeo", avatar: UIImage(named: "AlfaRomeo")),
        Group(name: "Renault", avatar: UIImage(named: "Renault"))
    ]




    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return groupNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupsCell", for: indexPath) as! GroupsCell

        let group = groupNames[indexPath.row]
        
        cell.groupNameLabel.text = group.name
        
        if group.avatar == nil {
            cell.groupAvatarView.image = UIImage(named: "")
        } else {
            cell.groupAvatarView.image = group.avatar
        }

        return cell
    }


}

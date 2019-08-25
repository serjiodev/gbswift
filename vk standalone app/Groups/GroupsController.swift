//
//  GroupsController.swift
//  vk standalone app
//
//  Created by Sergey Kosov on 20/08/2019.
//  Copyright © 2019 Kosov Sergey. All rights reserved.
//

import UIKit

class GroupsController: UITableViewController {

    fileprivate var groupNames = [
        Group(name: "Williams", avatar: UIImage(named: "Williams")),
        Group(name: "Ferrari", avatar: UIImage(named: "Ferrari"))
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }


    @IBAction func addGroup(segue: UIStoryboardSegue) {
        guard let allGroupsVC = segue.source as? AllGroupsController,
            let indexPath = allGroupsVC.tableView.indexPathForSelectedRow else { return }
        
        let newGroup = allGroupsVC.groupNames[indexPath.row]
        
        guard !groupNames.contains(where: { group -> Bool in
            group.name == newGroup.name
        }) else { return }
        
        groupNames.append(newGroup)
        tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupNames.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupsCell", for: indexPath) as! GroupsCell
        
        let group = groupNames[indexPath.row]
        
        cell.groupNameLabel.text = group.name
        
        if group.avatar == nil {
            cell.groupAvatarView.image = UIImage(named: "default")
        } else {
            cell.groupAvatarView.image = group.avatar
        }
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            groupNames.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
}

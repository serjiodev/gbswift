//
//  UsersVC.swift
//  vk standalone app
//
//  Created by Sergey Kosov on 14/08/2019.
//  Copyright © 2019 Kosov Sergey. All rights reserved.
//

import UIKit

protocol UsersDelegate {
    func vc(_ vc: UsersVC, didSelectUsers user: String)
}

class UsersVC: UITableViewController {
    
    var users: [String] = ["Moscow", "St.Petersburg", "Kazan", "Tver", "Ekaterinburg", "Helsinki", "Oulu", "Tampere", "Berlin", "Madrid", "Barselona"]
    
    var delegate: UsersDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return users.count
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        delegate?.vc(self, didSelectUsers: user)
        self.navigationController?.popViewController(animated: true)
    }
}

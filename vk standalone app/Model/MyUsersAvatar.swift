//
//  MyUsersAvatar.swift
//  vk standalone app
//
//  Created by Sergey Kosov on 17/08/2019.
//  Copyright © 2019 Kosov Sergey. All rights reserved.
//

import Foundation
import UIKit


struct User {
    let firstName: String
    let avatar: UIImage?
    let photos: [UIImage]
    
    
    static func getFriends() -> [User] {
        return [
            User(firstName: "Alex", avatar: UIImage(named: "alex")!, photos: [UIImage(named: "alex")!, UIImage(named: "alex")!, UIImage(named: "alex")!, UIImage(named: "alex")!]),
            
            User(firstName: "Jess", avatar: UIImage(named: "jess"), photos: [UIImage(named: "jess")!, UIImage(named: "jess")!, UIImage(named: "jess")!, UIImage(named: "jess")!]),
            
            User(firstName: "Jonn", avatar: UIImage(named: "jonn"), photos: [UIImage(named: "jonn")!, UIImage(named: "jonn")!, UIImage(named: "jonn")!]),
            
            User(firstName: "Marta", avatar: UIImage(named: "marta"), photos: [UIImage(named: "marta")!, UIImage(named: "marta")!, UIImage(named: "marta")!]),
            
            User(firstName: "Sofia", avatar: UIImage(named: "sofia"), photos: [UIImage(named: "sofia")!, UIImage(named: "sofia")!, UIImage(named: "sofia")!]),
            
            User(firstName: "Stas", avatar: UIImage(named: "stas"), photos: [UIImage(named: "stas")!, UIImage(named: "stas")!, UIImage(named: "stas")!]),
        ]
    }
    
}




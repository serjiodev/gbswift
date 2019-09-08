//
//  Friend.swift
//  vk standalone app
//
//  Created by Sergey Kosov on 20/08/2019.
//  Copyright © 2019 Kosov Sergey. All rights reserved.
//
import Foundation
import UIKit

struct User {
    let firstName: String
    let lastName: String
    let avatar: UIImage?
    let photos: UIImage!
    
    
    static func getFriends() -> [User] {
        return [

            User(firstName: "Kimi", lastName: "Raikkonen", avatar: UIImage(named: "KimiRaikkonen"), photos: UIImage(named: "KimiRaikkonen-1")),
            
            User(firstName: "Lewis", lastName: "Hamilton", avatar: UIImage(named: "LewisHamilton"), photos: UIImage(named: "LewisHamilton")),
            
            User(firstName: "Max", lastName: "Verstappen", avatar: UIImage(named: "MaxVerstappen"), photos: UIImage(named: "MaxVerstappen")),
            
            User(firstName: "Robert", lastName: "Kubica", avatar: UIImage(named: "RobertKubica"), photos: UIImage(named: "RobertKubica")),
            
            User(firstName: "Sebastian", lastName: "Vettel", avatar: UIImage(named: "SebastianVettel"), photos: UIImage(named: "SebastianVettel")),
            
            User(firstName: "Valtteri", lastName: "Bottas", avatar: UIImage(named: "ValtteriBottas"), photos: UIImage(named: "ValtteriBottas")),
            
            User(firstName: "George", lastName: "Russell", avatar: UIImage(named: "GeorgeRussell"), photos: UIImage(named: "GeorgeRussell")),
        ]
    }
    
}




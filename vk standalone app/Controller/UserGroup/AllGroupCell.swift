//
//  AllGroupCell.swift
//  vk standalone app
//
//  Created by Sergey Kosov on 14/08/2019.
//  Copyright © 2019 Kosov Sergey. All rights reserved.
//

import UIKit

class AllGroupCell: UITableViewCell {

    
    @IBOutlet weak var groupName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  NewsTableViewCell.swift
//  vk standalone app
//
//  Created by Sergey Kosov on 25/08/2019.
//  Copyright © 2019 Kosov Sergey. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var labelNews: UILabel!
    
    @IBOutlet weak var newsImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        labelNews.text = nil
        newsImageView.image = nil
    }
    
}

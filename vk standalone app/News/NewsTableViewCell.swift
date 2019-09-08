//
//  NewsTableViewCell.swift
//  vk standalone app
//
//  Created by Sergey Kosov on 25/08/2019.
//  Copyright © 2019 Kosov Sergey. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var newsName: UILabel!
    @IBOutlet weak var contentDescLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCellFromNews(_ news: News) {
        self.titleLabel.text = news.title
        self.pictureImageView.image = UIImage(named: news.imageName ?? "")
        self.newsName.text = news.newsName
        self.contentDescLabel.text = news.contentDesc
    }
    
}

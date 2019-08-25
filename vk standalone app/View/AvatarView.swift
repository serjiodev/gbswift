//
//  AvatarView.swift
//  vk standalone app
//
//  Created by Sergey Kosov on 20/08/2019.
//  Copyright © 2019 Kosov Sergey. All rights reserved.
//

import UIKit

class AvatarView: UIView {

    
    @IBOutlet var userAvatarView: UIImageView!
    @IBOutlet var shadowView: UIView!
    
    @IBInspectable var shadowColor: UIColor = .black {
        didSet { setNeedsDisplay() }
    }
    @IBInspectable var shadowRadius: CGFloat = 8 {
        didSet { setNeedsDisplay() }
    }
    @IBInspectable var shadowOpacity: Float = 1 {
        didSet { setNeedsDisplay() }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()


        shadowView.layer.masksToBounds = false
        shadowView.backgroundColor = .white
        shadowView.layer.shadowColor = shadowColor.cgColor
        shadowView.layer.shadowOpacity = shadowOpacity
        shadowView.layer.shadowRadius = shadowRadius
        shadowView.layer.shadowOffset = CGSize.zero
        

        userAvatarView.layer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        shadowView.layer.cornerRadius = bounds.width/2
        userAvatarView.layer.cornerRadius = bounds.width/2
    }
    
}

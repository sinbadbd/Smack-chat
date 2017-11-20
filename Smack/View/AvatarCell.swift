//
//  AvatarCell.swift
//  Smack
//
//  Created by imran on 11/20/17.
//  Copyright © 2017 Jonny B. All rights reserved.
//

import UIKit

enum AvaterType {
    case dark
    case light
}


class AvatarCell: UICollectionViewCell {
    
    @IBOutlet weak var avatarImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func congfigureCell(index: Int, type: AvaterType){
        if type == AvaterType.dark {
            avatarImg.image = UIImage(named: "dark\(index)")
            self.layer.backgroundColor = UIColor.lightGray.cgColor
        } else {
            avatarImg.image = UIImage(named: "light\(index)")
            self.layer.backgroundColor = UIColor.gray.cgColor
        }
    }
    
    
    func setupView(){
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
}

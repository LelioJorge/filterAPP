//
//  CollectionViewCell.swift
//  testeFiltros
//
//  Created by Lelio Jorge Junior on 01/08/19.
//  Copyright © 2019 Lelio Jorge Junior. All rights reserved.
//

import UIKit




class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageViewCell: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    var id: Int?

    var image: Data? {
        didSet{
            
            imageViewCell.image = UIImage(data: image!)
            imageViewCell.layer.cornerRadius = imageViewCell.frame.height / 4.0
        }
    }
    
    var textName: String? {
        didSet{
            nameLabel.text = textName
        }
    }

    
}

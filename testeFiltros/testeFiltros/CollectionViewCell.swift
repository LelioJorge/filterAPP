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

    var image: String? {
        didSet{
            imageViewCell.image = UIImage(named: image!)
            imageViewCell.layer.cornerRadius = imageViewCell.frame.height / 4.0
        }
    }
    
    var textName: String? {
        didSet{
            nameLabel.text = textName
        }
    }
   
//    init(id: Int, frame: CGRect) {
////        self.collectionView = collectionView
////        //Setup collectionView layout here and pass with init
////        let layout = UICollectionViewLayout()
//        self.id = id
//        super.init(frame: frame)
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
}

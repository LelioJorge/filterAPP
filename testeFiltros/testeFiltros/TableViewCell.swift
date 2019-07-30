//
//  TableViewCell.swift
//  testeFiltros
//
//  Created by Lelio Jorge Junior on 30/07/19.
//  Copyright © 2019 Lelio Jorge Junior. All rights reserved.
//

import UIKit


class TableViewCell: UITableViewCell {
    
    @IBOutlet  weak var nameMusic: UILabel!
    
    
    var name: String? {
        didSet{
            textLabel!.text = self.name
        }
    }
    
    
    
    
}

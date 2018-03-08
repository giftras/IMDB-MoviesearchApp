//
//  ListTableViewCell.swift
//  MSSearch
//
//  Created by Macbook Pro on 2/7/2560 BE.
//  Copyright © 2560 Student. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var movieTitle: UILabel!
    
    func configureCell(listinfo : ListInfo){
        movieTitle.text = listinfo.title
        
    }
    
   }

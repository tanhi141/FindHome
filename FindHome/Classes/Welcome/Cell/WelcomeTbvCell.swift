//
//  WelcomeTbvCell.swift
//  FindHome
//
//  Created by TaNhi on 10/2/18.
//  Copyright © 2018 TaNhi. All rights reserved.
//

import UIKit

class WelcomeTbvCell: UITableViewCell {
    
    @IBOutlet weak var btnFunction: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        btnFunction.setNextStyle();
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    
    }
    
}

//
//  AddressCell.swift
//  FindHome
//
//  Created by TaNhi on 7/18/18.
//  Copyright © 2018 TaNhi. All rights reserved.
//

import UIKit

class AddressCell: UITableViewCell {

    @IBOutlet weak var btSelecte: UIButton!
    @IBOutlet weak var lblAddress: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if selected{
            btSelecte.imageView?.image = #imageLiteral(resourceName: "ic_selected")
        } else {
            btSelecte.imageView?.image = #imageLiteral(resourceName: "ic_disselect")
        }
    }
    
}

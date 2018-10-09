//
//  WelcomeTbvCell.swift
//  FindHome
//
//  Created by TaNhi on 10/2/18.
//  Copyright © 2018 TaNhi. All rights reserved.
//

import UIKit

protocol WelcomeTbvCellDelegate: class {
    func didSelectButton(_ cell: WelcomeTbvCell, onTapped button: UIButton);
}

class WelcomeTbvCell: UITableViewCell {
    
    @IBOutlet weak var btnFunction: UIButton!
    weak var delegate: WelcomeTbvCellDelegate?;
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initUI();
    }
    
    func initUI(){
        btnFunction.setNextStyle();
        btnFunction.mask?.clipsToBounds = true
        self.backgroundColor = UIColor.clear;
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    
    }
    
}
extension WelcomeTbvCell{
    @IBAction func didSelectButtonFunction(sender: Any){
        delegate?.didSelectButton(self, onTapped: self.btnFunction)
    }
}


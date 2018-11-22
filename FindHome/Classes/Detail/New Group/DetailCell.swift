//
//  DetailCell.swift
//  FindHome
//
//  Created by TaNhi on 11/21/18.
//  Copyright © 2018 TaNhi. All rights reserved.
//

import UIKit

protocol DetailCellDelegate: class {
    func detailCell(_ cell: DetailCell, onTapped button: UIButton);
}

class DetailCell: UITableViewCell {
    
    
    @IBOutlet weak var btnNextImage: UIButton!
    @IBOutlet weak var btnBackImage: UIButton!
    @IBOutlet weak var imvImageHome: UIImageView!
    @IBOutlet weak var imvIcon: UIImageView!
    @IBOutlet weak var tvDetail: UITextView!
    
    weak var delegate: DetailCellDelegate?;
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imvImageHome.image = UIImage(named: "HOME1") ?? UIImage();
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}

extension DetailCell{
    @IBAction func didSelectButtonNext(sender: Any){
        delegate?.detailCell(self, onTapped: btnNextImage);
    }
    
    @IBAction func didSelectButtonBack(sender: Any){
        delegate?.detailCell(self, onTapped: btnBackImage);
    }
}


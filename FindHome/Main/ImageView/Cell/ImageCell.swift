

import UIKit

protocol ImageCellDelegate: class {
    func addAction(_ imageCell: ImageCell, onTapToDifferent button: UIButton);
}


class ImageCell: UICollectionViewCell {
    
     weak var delegate: ImageCellDelegate?;
    
    
    @IBOutlet weak var btnDelete: UIButton!
    @IBOutlet weak var imageCell: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
   
    }
}
extension ImageCell {
    @IBAction func onTapedDelete(_ button: UIButton){
        delegate?.addAction(self, onTapToDifferent: button);
    }
}

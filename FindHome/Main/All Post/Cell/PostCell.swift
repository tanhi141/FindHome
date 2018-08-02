

import UIKit

class PostCell: UITableViewCell {

    
     @IBOutlet weak var avatarImage: UIImageView?;
    
    @IBOutlet weak var lblTitle: UILabel?
    @IBOutlet weak var lblPrice: UILabel?

    @IBOutlet weak var lblType: UILabel?
    @IBOutlet weak var lblArea: UILabel?
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}

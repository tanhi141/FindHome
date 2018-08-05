
import UIKit

class TypeCell: UITableViewCell {
    @IBOutlet weak var icImageView: UIImageView!
    @IBOutlet weak var lblType: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected == true {
            icImageView.image = #imageLiteral(resourceName: "ic_selected")
        } else {
            icImageView.image = #imageLiteral(resourceName: "ic_disselect")
        }
    }
    
}

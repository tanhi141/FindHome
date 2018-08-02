
import Foundation
import  UIKit

protocol ImageView:class {
    func updateCollectionView(_ image: [UIImage]);
    func showWarning()
    func addImageView(_ image: UIImage?)
    
    //output
    func showDetailViewController(animated: Bool?, type: TypePost);
}


protocol ImagePresenting: class {
    func viewOnReady()
    func getListImage() -> [UIImage]
    
    func tappedButtonNext();
    func inputImage(_ image: UIImage)
    func deleteImage(idNumber: Int);
    
}



import Foundation
import UIKit


class ImagePresenter: ImagePresenting{
    
    private var view: ImageView?
    var listImage : [UIImage]?

    
    init(view: ImageView) {
        self.view = view
        self.listImage = DetailPost.shared.image ?? []
    }
    
    func viewOnReady(){
        
        if listImage?.isEmpty == false{
            view?.updateCollectionView(listImage!)
        }
    }
    
    func getListImage() -> [UIImage]{
        
        return self.listImage ?? []
    }
    
    func tappedButtonNext(){
        guard !(listImage?.isEmpty)! else {
            print("Khong có hình");
            return
        }
        DetailPost.shared.image = self.listImage;
        view?.showDetailViewController(animated: nil, type: .write)
    }
    
    func inputImage(_ image: UIImage){
        guard (listImage?.count)! < 9 else {
            return;
        }
        listImage?.append(image)

        view?.updateCollectionView(listImage!);
    }
    
    func removeImage(_ image: UIImage){
        for i in 0 ..< self.listImage!.count  {
            if self.listImage![i] == image{
                listImage?.remove(at: i)
            }
        }
    }
    
    func deleteImage(idNumber: Int){
        listImage?.remove(at: idNumber);
        view?.updateCollectionView(listImage!)
    }

}




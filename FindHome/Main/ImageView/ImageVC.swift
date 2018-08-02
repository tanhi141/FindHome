

import UIKit

class ImageVC: UIViewController {


    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var clImageView: UICollectionView!
    var presenter: ImagePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = ImagePresenter(view: self)
        setUp()
        clImageView.register(UINib(nibName: "ImageCell", bundle: nil), forCellWithReuseIdentifier: "ImageCell")
        presenter?.viewOnReady()
    }

    func setUp(){
        
        self.navigationItem.title = "Hình ảnh";
        btnNext.setNextStyle();
        
    }
}

//MARK: - ImageCellDelegate
extension ImageVC: ImageCellDelegate{
    func addAction(_ imageCell: ImageCell, onTapToDifferent button: UIButton) {
        if button === imageCell.btnDelete{
            let index = clImageView.indexPath(for: imageCell)
            presenter?.deleteImage(idNumber: (index?.item)! - 1)
        }
    }
}

extension ImageVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 78)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if presenter?.getListImage().count == 0{
            return 1;
        }
        return (presenter?.getListImage().count)! + 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = clImageView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as? ImageCell
        
        if indexPath.item == 0 {
            cell?.imageCell.image = #imageLiteral(resourceName: "icon_addPhoto")
            cell?.btnDelete.isHidden = true
            return cell!
        }
        
        let listImage = presenter?.getListImage() ?? []
        
        if (listImage.count) > 0 {
            cell?.imageCell.image = listImage[indexPath.item - 1]
            cell?.btnDelete.isHidden = false
            cell?.delegate = self
        }
        
        return cell!;
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == 0{
            Alert.showOptionAddImage(title: "Chọn hình ảnh", message: "", on: self) { (type: TypeAddImage) in
                switch type{
                case .Camera:
                    print("camera");
                    self.openCamera()
                    break;
                
                case .Library:
                    self.openLibrary()
                    print("Library")
                    break;
                case .Cancel:
                    print("cancel");
                }
            }
        }
    }
    
}
extension ImageVC: ImageView{
    
    func updateCollectionView(_ image: [UIImage]) {
        self.clImageView.reloadData()
    }
    
    func showWarning(){
        
    }
    
    func addImageView(_ image: UIImage?){
//        var cell : ImageCell? = nil
//        cell?.imageCell.image = image
//        cell?.btnDelete.isHidden = false
    }

    //output
    func showDetailViewController(animated: Bool?, type: TypePost){
        let viewController = DetailVC()
        viewController.presenter = DetailPresenter(view: viewController, type: type)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
//MARK: - Photo
extension ImageVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func openCamera(){
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    
    func openLibrary(){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
            
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true)
        
        guard let image = info[UIImagePickerControllerEditedImage] as? UIImage else {
            print("No image found")
            return
        }
        
        presenter?.inputImage(image);
        print(image.size)
    }
    
    
    
}

//MARK: - Action
extension ImageVC{
    @IBAction func tapButtonNext(_ sender: Any){
        presenter?.tappedButtonNext()
    }
}

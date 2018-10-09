//
//  WelcomeVC.swift
//  FindHome
//
//  Created by TaNhi on 10/1/18.
//  Copyright © 2018 TaNhi. All rights reserved.
//

import UIKit

class WelcomeVC: UIViewController {
        
    @IBOutlet weak var tbvFunction: UITableView!
    var presenter: WelcomePresenting?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tbvFunction.register(UINib(nibName: "WelcomeTbvCell", bundle: nil), forCellReuseIdentifier: "WelcomeTbvCell");
        
        initUI();
        presenter?.viewOnReady()
    }
    
    
    func initUI(){
        tbvFunction.isScrollEnabled = false;
        self.navigationController?.navigationBar.isHidden = true
        
    }
    
}

//MARK: - UICollectionViewDelegate,UICollectionViewDataSource
extension WelcomeVC: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4;
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.clear;
        
        return view;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbvFunction.dequeueReusableCell(withIdentifier: "WelcomeTbvCell", for: indexPath) as! WelcomeTbvCell
        
        switch indexPath.section {
        case 0:
            cell.btnFunction.setTitle("Tất cả", for: .normal);
            break;
        case 1:
            cell.btnFunction.setTitle("Lịch sử", for: .normal);
            break;
        case 2:
            cell.btnFunction.setTitle("Tài khoản", for: .normal);
            break;
        case 3:
            cell.btnFunction.setTitle("Thêm", for: .normal);
            break;
        default:
            cell.btnFunction.titleLabel?.text = "Unknow";
            break;
        }
        
        cell.delegate = self
        return cell;
    }

}

extension WelcomeVC: WelcomeTbvCellDelegate{
    func didSelectButton(_ cell: WelcomeTbvCell, onTapped button: UIButton) {
        let indexPath = tbvFunction.indexPath(for: cell);
        
        switch indexPath?.section {
        case 0:
            presenter?.tappedAllPost();
            
        case 1:
            break;
        
        case 2:
            break;
            
        case 3:
            break
        default:
            break;
        }
    }
    
    
}
//MaARK: - View
extension WelcomeVC: WelcomeView{
    
}











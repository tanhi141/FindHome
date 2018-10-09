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
    @IBOutlet weak var imvBackground: UIImageView!
    
    let idCell = "WelcomeTbvCell";
    var presenter: WelcomePresenting?
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tbvFunction.register(UINib(nibName: idCell, bundle: nil), forCellReuseIdentifier: idCell);
        
        initUI();
        presenter?.viewOnReady()
    }
    
    
    func initUI(){
        tbvFunction.isScrollEnabled = false;
        self.navigationController?.navigationBar.isHidden = true
        imvBackground.image = UIImage(named: "background");
        tbvFunction.backgroundColor = UIColor.clear;
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
        let cell = tbvFunction.dequeueReusableCell(withIdentifier: idCell, for: indexPath) as! WelcomeTbvCell
        
        switch indexPath.section {
        case 0:
            cell.btnFunction.setTitle(Title.allPostTitle, for: .normal);
            break;
        case 1:
            cell.btnFunction.setTitle(Title.historyTitle, for: .normal);
            break;
        case 2:
            if Check.shared.isLogin{
                    cell.btnFunction.setTitle(Title.accountTitle, for: .normal);
            } else {
                cell.btnFunction.setTitle(Title.loginTitle, for: .normal);
            }
            
            break;
        case 3:
            cell.btnFunction.setTitle(Title.moreTitle, for: .normal);
            break;
        default:
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
            presenter?.tappedAccount()
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











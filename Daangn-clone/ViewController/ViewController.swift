//
//  ViewController.swift
//  Daangn-clone
//
//  Created by 김준섭 on 2022/05/31.
//

import UIKit
import Floaty
class ViewController: UIViewController, FloatyDelegate {
    
    var homeModel = HomeModel()
    var floaty = Floaty()
    
    @IBOutlet weak var homeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "main-logo"), style: .plain, target: self, action: nil)
        leftBarButtonItem.tintColor = UIColor.black
        navigationItem.leftBarButtonItem = leftBarButtonItem
        setupTableView()
        layoutFAB()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        homeTableView.reloadData()
    }
    
    private func setupTableView() {
        // 1. 델리게이트 연결
        homeTableView.delegate = self
        homeTableView.dataSource = self
        
        // 3. 테이블뷰에 셀을 등록한다.
        homeTableView.register(
            UINib(nibName: "HomeTableViewCell", bundle: nil),
            forCellReuseIdentifier: "homeCell"
        )
    }
    
    func layoutFAB() {
        floaty.buttonImage = UIImage(named: "custom-add")
        floaty.buttonColor = UIColor.orange
//        floaty.hasShadow = false
//        floaty.layer.shadowPath = UIBezierPath(rect: floaty.bounds).cgPath
        floaty.layer.shadowPath = UIBezierPath(roundedRect: floaty.bounds, cornerRadius: floaty.layer.cornerRadius).cgPath
        floaty.addItem("내 물건 팔기", icon: UIImage(named: "sellItem")) { item in
            let AddMainCellViewController = self.storyboard?.instantiateViewController(withIdentifier: "AddMainCellViewController") as! AddMainCellViewController
            AddMainCellViewController.homeModel = self.homeModel
            AddMainCellViewController.delegate = self
            AddMainCellViewController.modalPresentationStyle = .fullScreen
            self.present(AddMainCellViewController, animated: true)
        }
        
        floaty.paddingY += tabBarController!.tabBar.bounds.size.height
        floaty.fabDelegate = self
        self.view.addSubview(floaty)
      
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeModel.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 2. 셀 생성
        let cell
        = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as! HomeTableViewCell
        
        cell.updateUI(cellData: homeModel.getCellData(index: indexPath.row))
        
        return cell
    }
    // swipe delete
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            homeModel.deleteCellData(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

extension ViewController: NewDataToPreviousVCDelegate {
    func newData(data: HomeModel) {
        homeModel = data
    }
}

//
//  ViewController.swift
//  Daangn-clone
//
//  Created by 김준섭 on 2022/05/31.
//

import UIKit

class ViewController: UIViewController {
    
    var homeModel = HomeModel()

    @IBOutlet weak var homeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
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
}

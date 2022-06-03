//
//  LifeViewController.swift
//  Daangn-clone
//
//  Created by 김준섭 on 2022/06/03.
//

import UIKit

class LifeViewController: UIViewController {
    
    var list = ["동네질문","동네맛집","동네소식","취미생활","같이해요","동네사건사고","일상","고양이"]
    var lifeModel = LifeModel()
    
    @IBOutlet weak var lifeTableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "main-logo"), style: .plain, target: self, action: nil)
        leftBarButtonItem.tintColor = UIColor.black
        navigationItem.leftBarButtonItem = leftBarButtonItem
        
        setupCollectionView()
        setupLifeTableView()
    }
    
    private func setupCollectionView() {
        // connect delegate
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        collectionView.register(
            UINib(nibName: "LifeCollectionViewCell", bundle: nil),
            forCellWithReuseIdentifier: "lifeCell"
        )
    }
    private func setupLifeTableView() {
        self.lifeTableView.delegate = self
        self.lifeTableView.dataSource = self
        
        self.lifeTableView.register(
            UINib(nibName: "LifeTableViewCell", bundle: nil),
            forCellReuseIdentifier: "lifeTableCell"
        )
    }
}

// UICollectionView
extension LifeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // create cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "lifeCell", for: indexPath) as! LifeCollectionViewCell
        
        cell.lifeUpdateUI(cellData: list[indexPath.row])
        
        return cell
    }
}

// UITableView
extension LifeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lifeModel.lifeCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell
        = tableView.dequeueReusableCell(withIdentifier: "lifeTableCell", for: indexPath) as! LifeTableViewCell
        
        cell.updateUI(cellData: lifeModel.getLifeCellData(index: indexPath.row))
        
        return cell
    }
}

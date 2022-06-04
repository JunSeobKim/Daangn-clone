//
//  AddMainCellViewController.swift
//  Daangn-clone
//
//  Created by 김준섭 on 2022/06/04.
//

import UIKit

// make protocol
protocol NewDataToPreviousVCDelegate: AnyObject {
    func newData(data: HomeModel)
}

class AddMainCellViewController: UIViewController {
    
    // init delegate
    weak var delegate: NewDataToPreviousVCDelegate?
    
    var homeModel = HomeModel()
    
    var addImage = ""
    var addTitle = ""
    var addPrice = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addImg(_ sender: UIButton) {
    }
    
    @IBAction func addTitle(_ sender: UITextField) {
        self.addTitle = sender.text ?? ""
    }
    
    @IBAction func addPrice(_ sender: UITextField) {
        self.addPrice = Int(sender.text!) ?? 0
    }
    
    @IBAction func buttonDidTap(_ sender: UIButton) {
        homeModel.addCellData(data: Product(title: addTitle, location: "양평동 5가", time: "방금", price: addPrice, image: "img01"))
        delegate?.newData(data: homeModel)
        self.dismiss(animated: true)
    }
    @IBAction func dismissBtnDidTap(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}

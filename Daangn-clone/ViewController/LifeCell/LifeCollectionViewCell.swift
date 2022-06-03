//
//  LifeCollectionViewCell.swift
//  Daangn-clone
//
//  Created by 김준섭 on 2022/06/03.
//

import UIKit

class LifeCollectionViewCell: UICollectionViewCell {
    static let identifier = "lifeCell"

    @IBOutlet weak var lifeCellLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    public func lifeUpdateUI(cellData: String) {
        self.lifeCellLabel.text = cellData
    }

}

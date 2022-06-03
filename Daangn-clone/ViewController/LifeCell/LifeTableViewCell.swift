//
//  LifeTableViewCell.swift
//  Daangn-clone
//
//  Created by 김준섭 on 2022/06/03.
//

import UIKit

class LifeTableViewCell: UITableViewCell {
    static let identifier = "lifeTableCell"

    @IBOutlet weak var lifeCategory: UILabel!
    @IBOutlet weak var lifeTableTitle: UILabel!
    @IBOutlet weak var lifeTableInfo: UILabel!
    @IBOutlet weak var lifeTableTime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func updateUI(cellData: Content) {
        self.lifeCategory.text = " \(cellData.category) "
        self.lifeTableTitle.text = cellData.title
//        self.lifeTableImage.image = UIImage(named: cellData.image ?? "")
        self.lifeTableInfo.text = "\(cellData.name) • \(cellData.location)"
        self.lifeTableTime.text = cellData.time
    }
    
}

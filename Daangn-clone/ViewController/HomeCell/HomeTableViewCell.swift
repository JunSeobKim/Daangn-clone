//
//  HomeTableViewCell.swift
//  Daangn-clone
//
//  Created by 김준섭 on 2022/06/02.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    static let identifier = "homeCell"

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellProductName: UILabel!
    @IBOutlet weak var cellInfo: UILabel!
    @IBOutlet weak var cellPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // TODO: price , 넣기
    public func updateUI(cellData: Product) {
        self.cellImage.image = UIImage(named: cellData.image)
        self.cellProductName.text = cellData.title
        self.cellInfo.text = "\(cellData.location) • \(cellData.time)"
        self.cellPrice.text = "\(String(cellData.price))원"
    }
}

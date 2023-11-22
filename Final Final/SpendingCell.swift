//
//  SpendingCellTableViewCell.swift
//  Final Final
//
//  Created by Lenora Duong on 11/12/23.
//

import UIKit

class SpendingCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    var spending: Spending!
    
    private func update(with spending: Spending) {
        titleLabel.text = spending.title
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: spending.date)
        dateLabel.text = dateString
        amountLabel.text = String(spending.amount)
    
    }
    
    func configure(with spending: Spending) {
        self.spending = spending
        update(with: spending)

        }


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  staticDataTableViewCell.swift
//  GymTracker
//
//  Created by Moritz on 03.02.23.
//

import UIKit

class staticDataTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var otherTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func update(with session: Session){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.YYYY"
        let stringDate = dateFormatter.string(from: session.date)
        dateLabel.text = stringDate
        otherTextLabel.text = session.other
    }
}


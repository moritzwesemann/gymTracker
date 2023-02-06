//
//  SessionTableViewCell.swift
//  GymTracker
//
//  Created by Moritz on 01.02.23.
//

import UIKit

class SessionTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var dateTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func update(with session: Session){
        titleTextLabel.text = session.title
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.YYYY"
        let date = formatter.string(from: session.date)
        dateTextLabel.text = date
    }
}

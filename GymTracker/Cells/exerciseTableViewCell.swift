//
//  exercisesTableViewCell.swift
//  GymTracker
//
//  Created by Moritz on 03.02.23.
//

import UIKit

class exerciseTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var exerciseNameLabel: UILabel!
    @IBOutlet weak var setsLabel: UILabel!
    @IBOutlet weak var repsLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


    func update(with exercise: Exercise){
        exerciseNameLabel.text = exercise.title
        
        setsLabel.text = "Sets: \(exercise.sets)"
        repsLabel.text = "Reps: \(exercise.reps)"
    }
}

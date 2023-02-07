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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }


    func update(with exercise: Exercise){
        
        
        exerciseNameLabel.text = exercise.title
        
        setsLabel.text = "Sets: \(exercise.sets)"
        repsLabel.text = "Reps: \(exercise.reps)"
    }
}

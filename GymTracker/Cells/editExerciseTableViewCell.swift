//
//  editExerciseTableViewCell.swift
//  GymTracker
//
//  Created by Moritz on 04.02.23.
//

import UIKit

class editExerciseTableViewCell: UITableViewCell {
    
    
    var setIndex = 0
    var exercise = Exercise(title: "", sets: 0, reps: 0, weight: [:])
    var sessions: [Session] = []
    var sessionIndex = 0
    var session: Session = Session(title: "", date: Date(), other: "")
    var exerciseIndex = 0
    
    @IBOutlet weak var setLabel: UILabel!
    @IBOutlet weak var weightTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        sessions = Session.loadFromFile()!
        session = sessions[sessionIndex]
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func weightTextFieldChanged(_ sender: Any) {
    
        sessions = Session.loadFromFile()!
        session = sessions[sessionIndex]
        exercise = session.exercises[exerciseIndex]
        
        exercise.weight[setIndex] = Int(weightTextField.text!)
        sessions[sessionIndex].exercises[exerciseIndex] = exercise
        Session.saveToFiles(sessions: sessions)
        
    }
    
    func update(with exercise: Exercise, set: Int, sessionIndex: Int, exerciseIndex: Int){
        
        setIndex = set
        self.exercise = exercise
        self.sessionIndex = sessionIndex
        self.exerciseIndex = exerciseIndex
        setLabel.text = "Set: \(set)"
        
        if let weight = exercise.weight[set] {
            weightTextField.text = String(weight)
            
        }
        
        
    }
    

    

}

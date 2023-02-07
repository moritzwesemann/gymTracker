//
//  editExerciseTableViewCell.swift
//  GymTracker
//
//  Created by Moritz on 04.02.23.
//

import UIKit

class editExerciseTableViewCell: UITableViewCell {
    
    
    var setIndex = 0
    var sessionIndex = 0
    var exerciseIndex = 0
    
    var exercise = Exercise(title: "", sets: 0, reps: 0, weight: [:])
    var sessions: [Session] = Session.loadFromFile()!
    var session: Session = Session(title: "", date: Date(), other: "")
    
    @IBOutlet weak var setLabel: UILabel!
    @IBOutlet weak var weightTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        session = sessions[sessionIndex]
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
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
        setLabel.text = "Set: \(set + 1)"
        
        
        if let weight = exercise.weight[set] {
            weightTextField.text = String(weight)
            
        }
        
    }

}

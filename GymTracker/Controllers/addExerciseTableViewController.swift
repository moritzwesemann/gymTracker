//
//  addExerciseTableViewController.swift
//  GymTracker
//
//  Created by Moritz on 03.02.23.
//

import UIKit

class addExerciseTableViewController: UITableViewController {
    
    
    var exercise: Exercise = Exercise(title: "", sets: 0, reps: 0, weight: [:])
    
    @IBOutlet weak var exerciseNameTextField: UITextField!
    
    @IBOutlet weak var exerciseSetsLabel: UILabel!
    @IBOutlet weak var exerciseSetsStepper: UIStepper!
    
    @IBOutlet weak var exerciseRepsLabel: UILabel!
    @IBOutlet weak var exerciseRepsStepper: UIStepper!

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    
    @IBAction func addExerciseButtonTapped(_ sender: Any) {
        var weightSets: [Int:Int] = [:]
        for i in 0...Int(exerciseSetsStepper.value){
            weightSets[i] = 0
        }
        exercise = Exercise(title: exerciseNameTextField.text!, sets: Int(exerciseSetsStepper.value), reps: Int(exerciseRepsStepper.value), weight: weightSets)
    }
    
    @IBAction func setsStepperChanged(_ sender: Any) {
        exerciseSetsLabel.text = "Sets: \(Int(exerciseSetsStepper.value))"
    }
    
    @IBAction func repsStepperChanged(_ sender: Any) {
        exerciseRepsLabel.text = "Reps: \(Int(exerciseRepsStepper.value))"
    }
   

}

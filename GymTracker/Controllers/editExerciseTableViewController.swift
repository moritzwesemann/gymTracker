//
//  editExerciseTableViewController.swift
//  GymTracker
//
//  Created by Moritz on 04.02.23.
//

import UIKit

class editExerciseTableViewController: UITableViewController {
    
    var sessionIndex = 0
    var exerciseIndex = 0
    var sessions: [Session] = Session.loadFromFile()!

    @IBOutlet weak var repsTopLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        repsTopLabel.text = "Reps: \(sessions[sessionIndex].exercises[exerciseIndex].reps)"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sessions[sessionIndex].exercises[exerciseIndex].sets
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "setCell", for: indexPath) as! editExerciseTableViewCell
        let exercise = sessions[sessionIndex].exercises[exerciseIndex]
        cell.update(with: exercise, set: indexPath.row, sessionIndex: sessionIndex, exerciseIndex: exerciseIndex)
        return cell
    }
    
}

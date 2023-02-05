//
//  singleSessionTableViewController.swift
//  GymTracker
//
//  Created by Moritz on 02.02.23.
//

import UIKit

class singleSessionTableViewController: UITableViewController {
    
    var sessionIndex = 0
    var sessions = Session.loadFromFile()!
    var session: Session = Session(title: "", date: Date(), other: "") {
        didSet{
            sessions[sessionIndex] = session
            Session.saveToFiles(sessions: sessions)
            sessions = Session.loadFromFile()!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        session = sessions[sessionIndex]
        navigationItem.title = session.title
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return session.exercises.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "staticDataCell", for: indexPath) as! staticDataTableViewCell
            cell.update(with: session)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "exercise", for: indexPath) as! exerciseTableViewCell
            let exercise = session.exercises[indexPath.row]
            cell.update(with:exercise)
                return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "singleExercise"{
            if let destination = segue.destination as? editExerciseTableViewController {
                let exerciseIndex = self.tableView.indexPathForSelectedRow!.row
                destination.sessionIndex = sessionIndex
                destination.exerciseIndex = exerciseIndex
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.section == 1) {
            performSegue(withIdentifier: "singleExercise", sender: self)
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            session.exercises.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            //Session.saveToFiles(sessions: sessions)
            //sessions = Session.loadFromFile()!
        }
    }
    
    @IBAction func unwindToSessionsScene(_ segue: UIStoryboardSegue){
        guard let sourceViewController = segue.source as? addExerciseTableViewController else {return}
        
        session.exercises.append(sourceViewController.exercise)
        sessions[sessionIndex] = session
        Session.saveToFiles(sessions: sessions)
        tableView.reloadData()
    }
}

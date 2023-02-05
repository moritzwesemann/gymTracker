//
//  SessionTableViewController.swift
//  GymTracker
//
//  Created by Moritz on 31.01.23.
//

import UIKit

class SessionTableViewController: UITableViewController {
    
    var sessions: [Session] = [] {
        didSet{
            Session.saveToFiles(sessions: sessions)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        if let savedSessions = Session.loadFromFile() {
            sessions = savedSessions
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sessions.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SessionCell", for: indexPath) as! SessionTableViewCell
        let session = sessions[indexPath.row]
        cell.update(with: session)
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            sessions.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
     // MARK: - Navigation
     
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "singleSession"{
            if let destination = segue.destination as? singleSessionTableViewController {
                let indexPath = self.tableView.indexPathForSelectedRow
                destination.sessionIndex = indexPath!.row
                
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "singleSession", sender: self)
    }
    
    
    @IBAction func unwindToSessionsScene(_ segue: UIStoryboardSegue){
        if let sourceViewController = segue.source as? CreateNewSessionTableViewController,
           let session = sourceViewController.session {
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow{
                sessions[selectedIndexPath.row] = session
                tableView.reloadRows(at: [selectedIndexPath], with: .automatic)
            } else {
                let newIndexPath = IndexPath(row: sessions.count, section: 0)
                sessions.append(session)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
            
            sessions = sessions.sorted(by: {$0.date.compare($1.date) == .orderedDescending})
            tableView.reloadData()
        }
    }
}

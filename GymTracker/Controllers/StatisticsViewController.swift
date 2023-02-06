//
//  StatisticsViewController.swift
//  GymTracker
//
//  Created by Moritz on 05.02.23.
//

import UIKit

class StatisticsViewController: UIViewController {
    
    var mostDoneExerciseCount = 0
    var sessions: [Session] = []
    
    
    @IBOutlet weak var sessionsCountLabel: UILabel!
    @IBOutlet weak var exerciseCountLabel: UILabel!
    @IBOutlet weak var setsCountLabel: UILabel!
    @IBOutlet weak var repsCountLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let savedSessions = Session.loadFromFile(){
            sessions = savedSessions
            
            sessionsCountLabel.text = getSessionCount(sessions: sessions)
            exerciseCountLabel.text = getExerciseCount(sessions: sessions)
            setsCountLabel.text = getSetsCount(sessions: sessions)
            repsCountLabel.text = getRepsCount(sessions: sessions)
            
        } else {
            sessions = []
        }
        
        
    }


    
    
    func getSessionCount(sessions: [Session]) -> String{
        
        var count = 0
        for _ in sessions {
            count += 1
        }
        return String(count)
    }
    
    func getExerciseCount(sessions:[Session]) -> String{
        
        var count = 0
        for session in sessions {
            for _ in session.exercises{
                count += 1
            }
        }
        return String(count)
    }
    
    func getSetsCount(sessions: [Session]) -> String{
        
        var count = 0
        for session in sessions {
            for exercise in session.exercises{
                count += exercise.sets
            }
        }
        return String(count)
    }
    
    func getRepsCount(sessions: [Session]) -> String{
        var count = 0
        for session in sessions {
            for exercise in session.exercises{
                count += exercise.reps * exercise.sets
            }
        }
        return String(count)
    }
}

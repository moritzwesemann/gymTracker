//
//  CreateNewSessionTableViewController.swift
//  GymTracker
//
//  Created by Moritz on 31.01.23.
//

import UIKit
import Foundation

class CreateNewSessionTableViewController: UITableViewController {
    
    var session: Session?
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var otherTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init?(coder: NSCoder, session: Session?){
        self.session = session
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        guard let title = titleTextField.text,
              let other = otherTextView.text else {return}
        
        let date = datePicker.date
        session = Session(title: title, date: date, other: other)
        performSegue(withIdentifier: "unwindToSessionsScene", sender: self)
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "unwindToSessionsScene", sender: self)
    }

}

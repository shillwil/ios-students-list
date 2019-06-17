//
//  MainViewController.swift
//  Students
//
//  Created by Alex Shillingford on 6/17/19.
//  Copyright © 2019 Lambda Inc. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var sortSelector: UISegmentedControl!
    @IBOutlet weak var filterSelector: UISegmentedControl!
    
    private var studentsTableViewController: StudentsTableViewController!
    
    private var students: [Student] = [] {
        didSet {
            updateDataSource()
        }
    }
    private let studentController = StudentController()

    override func viewDidLoad() {
        super.viewDidLoad()

        studentController.loadFromPersistentStore { students, error in
            if let error = error {
                print("Error loading students: \(error)")
                return
            }
            
            DispatchQueue.main.async {
                self.students = students ?? []
            }
        }
    }
    
    private func updateDataSource() {
        var sortedAndFilteredStudents: [Student]
        switch filterSelector.selectedSegmentIndex {
        case 1: // Filter for iOS
            sortedAndFilteredStudents = students.filter { $0.course == "iOS" }
        case 2: // FIlter for Web
            sortedAndFilteredStudents = students.filter { $0.course == "Web" }
        case 3: // Filter for UX
            sortedAndFilteredStudents = students.filter { $0.course == "UX" }
        default: // filter for none, or any other number
            sortedAndFilteredStudents = students
        }
        
    }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        studentsTableViewController = (segue.destination as! StudentsTableViewController)
    }
}

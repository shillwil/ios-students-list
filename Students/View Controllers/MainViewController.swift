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
    
    private var students: [Student] = []
    private let studentController = StudentController()

    override func viewDidLoad() {
        super.viewDidLoad()

        studentController.loadFromPersistentStore { students, error in
            
        }
    }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }

}

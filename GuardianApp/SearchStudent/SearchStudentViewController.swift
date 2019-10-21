//
//  SearchStudentViewController.swift
//  GuardianApp
//
//  Created by Alexander Stevens on 10/21/19.
//  Copyright © 2019 Alex Stevens. All rights reserved.
//

import UIKit

class SearchStudentViewController: UIViewController {
    
    @IBAction func searchPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "StudentGuardianSelection", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "studentGuardianSelection")
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//
//  ConfirmGuardianViewController.swift
//  GuardianApp
//
//  Created by Noah Flaniken on 10/21/19.
//  Copyright © 2019 Alex Stevens. All rights reserved.
//

import UIKit

class ConfirmGuardianViewController: UIViewController {
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var relationship: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var confirmGuardianButton: UIView!
    
    var newGuardian = GuardianModel(firstName: "",lastName: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        confirmGuardianButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(confirmGuardianPressed)))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        firstNameLabel.text = newGuardian.firstName
        lastNameLabel.text = newGuardian.lastName
    }
    

    // MARK: Actions
    
    @objc func confirmGuardianPressed() {

        self.performSegue(withIdentifier: "confirmGuardianSegue", sender: self)
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == "confirmGuardianSegue" {
            
            if let destination = segue.destination as? ConfirmCheckInViewController {
                //destinaton.maps = sender as? [SkiMap]
                print("preparing segue")
                
                var addedGuardian = GuardianModel (firstName: newGuardian.firstName, lastName: newGuardian.lastName)
                destination.addedGuardian = addedGuardian
                
            }
        }
        
    }

}

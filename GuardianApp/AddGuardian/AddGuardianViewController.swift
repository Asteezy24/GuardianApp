//
//  AddGuardianViewController.swift
//  GuardianApp
//
//  Created by Noah Flaniken on 10/21/19.
//  Copyright © 2019 Alex Stevens. All rights reserved.
//

import UIKit

class AddGuardianViewController: UIViewController {

    @IBOutlet weak var firstNameInput: UITextField!
    @IBOutlet weak var lastNameInput: UITextField!
    @IBOutlet weak var phoneInput: UITextField!
    @IBOutlet weak var addGuardianButton: UIView!
    
    // Guardian data from textfields
    var firstName: String?
    var lastName: String?
    var phoneNumber: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGuardianButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(addGuardianPressed)))
        
        // Do any additional setup after loading the view.
    }
    
    
    // MARK: Actions
    
    @objc func addGuardianPressed() {
        
        firstName = firstNameInput.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        lastName = lastNameInput.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        phoneNumber = phoneInput.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if (firstName ?? "").isEmpty || (lastName ?? "").isEmpty || (phoneNumber ?? "").isEmpty {
            print("Throw An Error")
        } else {
            print("first name: " + firstName!)
            print("last name: " + lastName!)
            print("phone number: " + phoneNumber!)
        }
            
            
        self.performSegue(withIdentifier: "addGuardianSegue", sender: self)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == "addGuardianSegue" {
            
            if let destination = segue.destination as? ConfirmGuardianViewController {
                //destinaton.maps = sender as? [SkiMap]
                print("preparing segue")
                
                let newGuardian = GuardianModel (firstName: firstName!, lastName: lastName!)
                destination.newGuardian = newGuardian
                
            }
        }
        
    }
    
    

}

//
//  StudentListViewController.swift
//  CheckIn
//
//  Created by Anand Kelkar on 04/12/18.
//  Copyright © 2018 Anand Kelkar. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class StudentListViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var data: Array<StudentData> = []
    
    struct StudentData {
        var id:String?
        var fname:String?
        var lname:String?
        var checked:Bool = false
        var sname:String?
    }
    
    //Variable used to identify selected student before passing it to the profile view
    var selectedStudent: StudentData?
    
    //Variable used to store the filtered list
    var filteredStudents = [StudentData]()
    
    //Dummy data for test
    func generateDummyData() {
        let s1 = StudentData(id: "1234", fname: "Harry",lname: "Potter",checked: true,sname: "Hogwarts School Of Witchcraft and Wizardry")
        let s2 = StudentData(id: "5678", fname: "Ron", lname: "Weasley", checked: false,sname: "Hogwarts School Of Witchcraft and Wizardry")
        let s3 = StudentData(id: "9012", fname: "Ginny", lname: "Weasley", checked: true,sname: "Hogwarts School Of Witchcraft and Wizardry")
        let s4 = StudentData(id: "3456", fname: "Hermione", lname: "Granger", checked: false,sname: "Hogwarts School Of Witchcraft and Wizardry")
        
        data.append(s1)
        data.append(s2)
        data.append(s3)
        data.append(s4)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateDummyData()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Students"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
    }
    
    //Method to return the number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Method to return the number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredStudents.count
        }
        return data.count
    }
    
    //Method to populate the rows
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentListCell") as! StudentTableViewCell
        
        var student:StudentData?
        if isFiltering() {
            student = filteredStudents[indexPath.row]
        }
        else {
            student = data[indexPath.row]
        }
        
        
        cell.fname.text = student!.fname
        cell.lname.text = student!.lname
//        
//        if(student!.checked){
//            cell.checkMark.image = UIImage(named: "checkmark")
//        }
//        else {
//            cell.checkMark.image = nil
//        }
//        
        cell.fname.numberOfLines=0;
        cell.fname.font = UIFont(name: "HelveticaNeue", size: 20)
        cell.fname.minimumScaleFactor = 0.1
        cell.fname.adjustsFontSizeToFitWidth=true
        
        cell.lname.numberOfLines=0;
        cell.lname.font = UIFont(name: "HelveticaNeue", size: 20)
        cell.lname.minimumScaleFactor = 0.1
        cell.lname.adjustsFontSizeToFitWidth=true
        
        return cell
    }
    
    /*
        Method that defines action to be done when a row is selected
        In this case, populate selectedStudent and perform segue to profileView
     */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isFiltering() {
            selectedStudent = filteredStudents[indexPath.row]
        }
        else {
            selectedStudent = data[indexPath.row]
        }
        self.performSegue(withIdentifier: "showProfile", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
//        if let profile = segue.destination as? ProfileViewController
//        {
//            profile.fname = (selectedStudent?.fname)!
//            profile.lname = (selectedStudent?.lname)!
//            profile.id = (selectedStudent?.id)!
//        }
    }
    
    
    let searchController = UISearchController(searchResultsController: nil)
    
    //Function checks if list has been filtered via search text
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    //Function checks if search text is empty
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    //Function to create filtered list based on search text
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredStudents = data.filter({( student : StudentData) -> Bool in
            return (student.fname!.lowercased().contains(searchText.lowercased()) || student.lname!.lowercased().contains(searchText.lowercased()))
        })
        
        tableView.reloadData()
    }
    
    
    
}

//Extension updates delegate when search text changes
extension StudentListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}

//
//  SearchStudentViewController.swift
//  GuardianApp
//
//  Created by Alexander Stevens on 10/21/19.
//  Copyright © 2019 Alex Stevens. All rights reserved.
//

import UIKit
import CoreData

class SearchStudentViewController: UIViewController {
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    var searchController: UISearchController?
    var filteredTableData = [String]()
    var listOfNames = [String]()
    var searchActive = false
    
    //constraints
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDummyData()
        tableView.register(SearchStudentResultCell.self, forCellReuseIdentifier: "result")
    }
    
    private func fetchDummyData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")

        do {
            let results = try context.fetch(fetchRequest)
            let students = results as! [Student]

            for student in students {
                listOfNames.append(student.name ?? "")
            }
        }catch let err as NSError {
            print(err.debugDescription)
        }
    }
}

extension SearchStudentViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "result", for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
}

extension SearchStudentViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("started")
        searchActive = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("done")
        searchActive = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
              filteredTableData.removeAll(keepingCapacity: false)
              guard let text = searchBar.text else { return }
              let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", text)
        
              guard let unwrappedListOfNames = listOfNames as? NSArray else { return }
              let array = (unwrappedListOfNames).filtered(using: searchPredicate)
              filteredTableData = array as! [String]
              tableView.reloadData()
    }
    
//    // MARK: SearchBar Methods
//    func updateSearchResults(for searchController: UISearchController) {
//      filteredTableData.removeAll(keepingCapacity: false)
//      guard let text = searchController.searchBar.text else { return }
//      let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", text)
//
//      guard let unwrappedListOfStocks = stockSearchViewModel?.model?.listOfStocks as? NSArray else { return }
//      let array = (unwrappedListOfStocks).filtered(using: searchPredicate)
//      filteredTableData = array as! [String]
//      tableView.reloadData()
//    }

}

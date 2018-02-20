//
//  CanidatesTableViewController.swift
//  TschidaTrace-hw5
//
//  Created by user135456 on 2/19/18.
//  Copyright © 2018 tracetschida_cs329. All rights reserved.
//

import UIKit
import CoreData

class CanidatesTableViewController: UITableViewController {
    
    var Db: DbContext = DbContext()
    var people: [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

       // Set the Navigation Information
        self.navigationItem.title = "Show Canidates"
        
        // Load the data
        people = Db.people
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of people
        return people.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "canidate_id", for: indexPath)
        
        // Get the person
        let person = people[indexPath.row] as? Person
        
        // Get Person Info
        let firstName = person?.firstName ?? ""
        let lastName = person?.lastName ?? ""
        let politcalParty = person?.politicalParty ?? ""

        // Configure the cell...
        cell.textLabel?.text = firstName + " " + lastName
        cell.detailTextLabel?.text = politcalParty

        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        super.prepare(for: segue, sender: sender)
        
        // Get the index Path to select the correct person object
        if let indexPath = self.tableView.indexPathForSelectedRow
        {
            // Get the Selected Row from the Table View
            let selectedRow = indexPath.row
            
            // Grab the next View
            let canidateInfoiewController = segue.destination as? CanidateInfoViewController
            
            // Pass the Canidate Object to the next view
            // Need to downcast the person object to Type people from NSManagedObject
            canidateInfoiewController?.person = self.people[selectedRow] as? Person
        }
        
    }
    

}

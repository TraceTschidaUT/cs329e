//
//  PeopleTableViewController.swift
//  TschidaTrace-hw3
//
//  Created by Trace Tschida on 2/6/18.
//  Copyright © 2018 cs329e. All rights reserved.
//

import UIKit

class PeopleTableViewController: UITableViewController 
{
    // Properties
    private var people: [Person] = []
    
    // Methods
    private func createDataModel()
    {
        let firstNames: [String] = ["Bob", "John", "Led", "Sam", "June", "Allison", "Donald", "Hilary", "Barrack", "Teddy"]
        let lastNames: [String] = ["Carpenter", "Jones", "Zeppelin", "Smith", "Johnson", "Atwater", "Trump", "Clinton", "Obama", "Roosevelt"]
        let ages: [Int] = [35, 8, 73, 34, 12, 21, 56, 69, 53, 70]
        let cities: [String] = ["Austin", "Boston", "Paris", "Sydney", "Vienna", "Venice", "Munich", "Brussels", "Tokyo", "Shanghai"]
        
        for count in 0...9
        {
            // Create a person
            let person: Person = Person(firstName: firstNames[count], lastName: lastNames[count], age: ages[count], city: cities[count])
            
            // Add the person to the Person Array
            people.append(person)
        }
    }
    override func viewDidLoad() 
    {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        // Load the People Data Model
        createDataModel()
    }

    override func didReceiveMemoryWarning() 
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int 
    {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int 
    {
        // Number of rows = number of people in data model
        return people.count
    }

    // Gets called
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell 
    {
        // Change the Identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: "person_identifier", for: indexPath)

        // Configure the cell...
        let person = people[indexPath.row]
        cell.detailTextLabel?.text = person.lastName
        cell.textLabel?.text = person.firstName

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

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
            let personViewController = segue.destination as? PersonViewController
            
            // Pass the Person Object to the next view
            personViewController?.person = self.people[selectedRow]
        }
    }

}

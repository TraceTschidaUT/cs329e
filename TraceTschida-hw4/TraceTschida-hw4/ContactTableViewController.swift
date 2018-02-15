//
//  ContactTableViewController.swift
//  TraceTschida-hw4
//
//  Created by Trace Tschida on 2/13/18.
//  Copyright © 2018 cs329e. All rights reserved.
//

import UIKit

class ContactTableViewController: UITableViewController, PersonAlertDelegate
{
    // Properties
    var alertController:UIAlertController? = nil
    private var people: [Person] = []
    
    // Lables
    @IBOutlet var contactTableView: UITableView!
    
    // Methods
    private func createDataModel()
    {
        let firstNames: [String] = ["Joe", "Sam", "Sue", "Zoey", "Alan", "Chris", "Danny", "Eli", "Frank"]
        let lastNames: [String] = ["Johnson", "Smith", "Jefferson", "Zimmerman", "Albright", "Chambers", "Donaldson", "Edgerton", "Farmer"]
        let ages: [Int] = [35, 27, 52, 17, 83, 33, 6, 10, 100]
        let cities: [String] = ["Austin", "Marble Falls", "Houston", "San Antonio", "Dallas", "Round Rock", "Cedar Park", "Leadner", "Webster"]
        let streets: [String] = ["1 Main Street", "2 Main Street", "3 Main Street", "4 Main Street", "5 Main Street", "6 Main Street", "7 Main Street", "8 Main Street", "9 Main Street"]
        let states: [String] = ["TX", "TX", "TX", "TX", "TX", "TX", "TX", "TX", "TX"]
        let zips: [Int] = [78128, 78228, 78328, 78428, 78528, 78628, 78728, 78828, 78928,]
        
        for count in 0...8
        {
            // Create a person
            let person: Person = Person(firstName: firstNames[count], lastName: lastNames[count], age: ages[count], street: streets[count], city: cities[count], state: states[count], zip: zips[count])
            
            // Add the person to the Person Array
            people.append(person)
        }
    }
    
    // Delegate function
    func buttonPersonAlert(_ rowIndex: Int)
    {
        let person: Person = people[rowIndex]

        // Set the Alert Controller
        self.alertController = UIAlertController(title: "Person", message: "\(person.firstName) \(person.lastName) \(person.age)", preferredStyle: UIAlertControllerStyle.alert)
        
        // Add an Ok action
        let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
        
        self.alertController!.addAction(OKAction)
        
        self.present(self.alertController!, animated: true, completion:nil)
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        // Load the Data Model
        self.createDataModel()
        
        // Set the delegate for the table view to this controller
        self.contactTableView.delegate = self
        
        // Set the navigation title
        self.navigationItem.title = "People List"
    }
    
    // Not called when alert is dismissed.
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        // 1 sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // Return the total number of people
        return people.count * 2
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
     {
        // Since each person has 2 row, need to get the correct index for each
        let index: Int = Int(floor((Double(indexPath.row / 2))))
        let person = people[index]
        
        // Meaning even number row -> NameTableViewCell
        if indexPath.row % 2 == 0
        {
            // Cast the cell to NameTableViewCell
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "name_id", for: indexPath) as! NameTableViewCell
            
            // Set the Labels
            cell.firstNameLabel.text = person.firstName
            cell.lastNameLabel.text = person.lastName
            cell.tag = index
            
            // Associate the cells with this controller
            cell.delegate = self
            
            return cell
            
        }
        // Odd number rows -> AddressTableViewCell
        else
        {
            // Get the cell and cast it as Address
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "address_id", for: indexPath) as! AddressTableViewCell
            
            // Set the properties
            cell.streetLabel.text = person.street
            cell.cityLabel.text = person.city
            cell.stateLabel.text = person.state
            cell.zipLabel.text = String(person.zip)
            cell.tag = index
            
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        // Since each person has 2 rows, even rows are Name Cells, odd Rows are Address Cells
        // Name Cells = 50, Address cell = 55
        if indexPath.row % 2 == 0
        {
            return CGFloat(50)
        }
        else
        {
            return CGFloat(55)
        }
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
     
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
     {
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
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath)
     {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool
     {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
     {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

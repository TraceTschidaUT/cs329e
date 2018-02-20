//
//  AddCanidateViewController.swift
//  TschidaTrace-hw5
//
//  Created by user135456 on 2/19/18.
//  Copyright © 2018 tracetschida_cs329. All rights reserved.
//

import UIKit

class AddCanidateViewController: UIViewController, UITextFieldDelegate {
    
    // Properties
    @IBOutlet weak var firstNameLabel: UITextField!
    @IBOutlet weak var lastNameLabel: UITextField!
    @IBOutlet weak var stateLabel: UITextField!
    @IBOutlet weak var savedLabel: UILabel!
    @IBOutlet weak var policalPartySegmentedControl: UISegmentedControl!
    var alertController: UIAlertController? = nil
    
    
    // Actions
    @IBAction func saveCanidateButton(_ sender: UIButton) {
        
        // Add the canidate to the db
        let Db = DbContext()
        
        // Get the correct text information
        guard let firstName = firstNameLabel.text else {
            return
        }
        guard let lastName = lastNameLabel.text else {
            return
        }
        guard let state = stateLabel.text else {
            return
        }
        
        guard let politicalParty: String = policalPartySegmentedControl.titleForSegment(at: policalPartySegmentedControl.selectedSegmentIndex) else {
            
            return
        }
        
        // Check if any of the values are blank
        if firstName.trimmingCharacters(in: .whitespaces).isEmpty || lastName.trimmingCharacters(in: .whitespaces).isEmpty || state.trimmingCharacters(in: .whitespaces).isEmpty {
            
            // Create an Alert
            // Set the Alert Controller
            self.alertController = UIAlertController(title: "Values Empty", message: "You must enter a value for all fields.", preferredStyle: UIAlertControllerStyle.alert)
            
            // Add an Ok action
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
            
            self.alertController!.addAction(OKAction)
            
            self.present(self.alertController!, animated: true, completion:nil)
            
        }
        else {
            
            // Add a person to the database
            Db.savePerson(firstName: firstName, lastName: lastName, state: state, politicalParty: politicalParty)
            
            // Change the saved Label
            savedLabel.text = "Candidate Saved!"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view
        // Connect the Delegates for textfields
        self.firstNameLabel.delegate = self
        self.lastNameLabel.delegate = self
        self.stateLabel.delegate = self
        
        // Set the Title
        self.navigationItem.title = "Add Candidate"
        
        // Clear the Saved! Text
        self.savedLabel.text = ""
    }
    
    // Control the Keyboards Operations
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

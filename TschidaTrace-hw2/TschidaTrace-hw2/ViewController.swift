//
//  ViewController.swift
//  TschidaTrace-hw2
//
//  Created by Trace Tschida on 2/1/18.
//  Copyright © 2018 cs329e. All rights reserved.
//

import UIKit

// UITextFieldDelegate = protocol for Textfields
// Holds the contract between the Principal and the Delegate
// Principal = nameTextField, contains a Delegate property of type UITextFieldDelegate
// Delegate = The View Controller
// The View Controller implements the protocol and there for is the Delegate to nameTextField
// This is why you have to set nameTextField to self, because self implements UITextFieldDelegate
class ViewController: UIViewController, UITextFieldDelegate
{
    // View Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    
    // Button Handler
    @IBAction func btnSaveClicked(_ sender: Any)
    {
        guard let nameText: String = nameTextField.text else
        {
            messageLabel.text = "You must enter a value for *both* name and city!!"
            return
        }
        guard let cityText: String = cityTextField.text else
        {
            messageLabel.text = "You must enter a value for *both* name and city!!"
            return
        }
        
        if nameText.trimmingCharacters(in: .whitespaces).isEmpty || cityText.trimmingCharacters(in: .whitespaces).isEmpty
        {
            messageLabel.text = "You must enter a value for *both* name and city!!"
            return
        }
        
        messageLabel.text = nameText + " - " + cityText
    }
    
    // Closes the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    
    // Opens the keyboard
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool
    {
        return true
    }
    
    // Stops Editing
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool
    {
        return true
    }
    
    // When user touches elsewhere, will close the keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Sets the delgeate of UITextField to the instance of this class
        self.nameTextField.delegate = self
        self.cityTextField.delegate = self
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


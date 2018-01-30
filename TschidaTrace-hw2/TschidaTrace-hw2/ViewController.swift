//
//  ViewController.swift
//  TschidaTrace-hw2
//
//  Created by Trace Tschida on 1/30/18.
//  Copyright © 2018 cs329e. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var responseLabel: UILabel!
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        // Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    

    @IBAction func textFieldDidEndEditing(_ textField: UITextField)
    {
        nameTextField.text = textField.text
    }
    
    // MARK: Actions
    @IBAction func saveButton(_ sender: UIButton)
    {
        let defaultLabel: String = "You must enter a value for *both* name and city!!"
        
        guard let nameText = nameTextField.text else
        {
            responseLabel.text = defaultLabel
            return
        }
        
        guard let cityText = cityTextField.text else
        {
            responseLabel.text = defaultLabel
            return
        }
        
        responseLabel.text = nameText + " " + cityText
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        
        // Handle the text field's user input through delegate callback
        nameTextField.delegate = self
        cityTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


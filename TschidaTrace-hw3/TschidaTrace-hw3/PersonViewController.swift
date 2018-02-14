//
//  PersonViewController.swift
//  TschidaTrace-hw3
//
//  Created by Trace Tschida on 2/6/18.
//  Copyright © 2018 cs329e. All rights reserved.
//

import UIKit

class PersonViewController: UIViewController 
{
    
    // Properties
    var person: Person?

    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Set the properties
        
        // Unbind the Optional Age Int into a string
        var age: String = ""
        if let ageNum: Int = person?.age
        {
            age = String(ageNum)
        }
        
        // Set the remaing properties
        firstNameLabel.text = person?.firstName
        lastNameLabel.text = person?.lastName
        ageLabel.text = age
        cityLabel.text = person?.city
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

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

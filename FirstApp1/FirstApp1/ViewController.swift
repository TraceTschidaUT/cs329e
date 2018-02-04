//
//  ViewController.swift
//  FirstApp1
//
//  Created by user135456 on 1/30/18.
//  Copyright © 2018 tracetschida_cs329. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblFirstIosApp: UILabel!
    @IBOutlet weak var txtField: UITextField!
    
    
    @IBAction func btnTap(_ sender: Any)
    {
        print(txtField.text ?? "No text")          
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  HomeViewController.swift
//  TschidaTrace-hw5
//
//  Created by user135456 on 2/18/18.
//  Copyright © 2018 tracetschida_cs329. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Set the Navigation Title
        self.navigationItem.title = "Candidate Manager"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        super.prepare(for: segue, sender: sender)
        
        let button = sender as? UIButton
        
        // determine the button that is being called
        // The Add Canidate Button
        if button?.tag == 0 {
            
            
        }
            // The Show Canidates Button
        else {
            
        }
        
        // Set the backbar button
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        self.navigationItem.backBarButtonItem = backItem
    }
    

}

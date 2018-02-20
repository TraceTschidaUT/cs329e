//
//  CanidateInfoViewController.swift
//  TschidaTrace-hw5
//
//  Created by user135456 on 2/19/18.
//  Copyright © 2018 tracetschida_cs329. All rights reserved.
//

import UIKit

class CanidateInfoViewController: UIViewController {
    
    // Properties
    var person: Person?
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var politicalPartyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Make the Labels from the segued personset in the pervious controller
        
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

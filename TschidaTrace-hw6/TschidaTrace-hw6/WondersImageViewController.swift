//
//  WondersImageViewController.swift
//  TschidaTrace-hw6
//
//  Created by Trace Tschida on 2/27/18.
//  Copyright © 2018 cs329e. All rights reserved.
//

import UIKit

class WondersImageViewController: UIViewController {
    
    // UI Properties
    @IBOutlet weak var wondersImageView: UIImageView!
    
    // Controller Properties
    var currentImage = UIImage()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wondersImageView.image = currentImage
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

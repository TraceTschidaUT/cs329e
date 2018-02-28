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
        
        // Set the image view to the current image
        // The current image will be set by the PageViewController
        wondersImageView.image = currentImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

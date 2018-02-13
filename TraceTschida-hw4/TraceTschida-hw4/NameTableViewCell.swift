//
//  NameTableViewCell.swift
//  TraceTschida-hw4
//
//  Created by Trace Tschida on 2/13/18.
//  Copyright © 2018 cs329e. All rights reserved.
//

import UIKit

class NameTableViewCell: UITableViewCell
{

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    
    @IBAction func showFullNameDetailsButton(_ sender: Any)
    {
    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

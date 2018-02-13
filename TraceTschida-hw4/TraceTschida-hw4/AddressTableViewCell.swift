//
//  AddressTableViewCell.swift
//  TraceTschida-hw4
//
//  Created by Trace Tschida on 2/13/18.
//  Copyright © 2018 cs329e. All rights reserved.
//

import UIKit

class AddressTableViewCell: UITableViewCell
{
    
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var zipLabel: UILabel!
    

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

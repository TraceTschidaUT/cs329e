//
//  NameTableViewCell.swift
//  TraceTschida-hw4
//
//  Created by Trace Tschida on 2/13/18.
//  Copyright © 2018 cs329e. All rights reserved.
//

import UIKit

protocol PersonAlertDelegate
{
    // Will create an Alert on the ViewController
    func buttonPersonAlert(_ rowIndex: Int)
}

class NameTableViewCell: UITableViewCell
{
    var delegate: PersonAlertDelegate?

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    
    @IBAction func showFullNameDetailsButton(_ sender: UIButton)
    {
        // Get the row from the index path of the button's parent view, the cell
        let row: Int = Int(floor(Double(sender.tag / 2)))
    
        // Call the alert function on the ContactTableViewController
        delegate?.buttonPersonAlert(row)
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

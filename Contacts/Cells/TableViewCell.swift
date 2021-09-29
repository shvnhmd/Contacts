//
//  TableViewCell.swift
//  Contacts
//
//  Created by Ikhtiar Ahmed on 11/22/20.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    
    
    static let idetifier = "TableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "TableViewCell", bundle: nil)
    }
    
  
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

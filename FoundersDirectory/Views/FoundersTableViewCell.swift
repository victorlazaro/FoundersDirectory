//
//  FoundersTableViewCell.swift
//  FoundersDirectory
//
//  Created by Victor Lazaro on 9/27/17.
//  Copyright © 2017 Victor Lazaro. All rights reserved.
//

import UIKit

class FoundersTableViewCell: UITableViewCell {
    
    // MARK :- Outlets
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

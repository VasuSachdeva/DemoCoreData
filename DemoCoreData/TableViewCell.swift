//
//  TableViewCell.swift
//  DemoCoreData
//
//  Created by MAC on 06/03/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

	@IBOutlet weak var nameInfo: UILabel!
	@IBOutlet weak var mobilenumberInfo: UILabel!
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
	@IBOutlet weak var passwordInfo: UILabel!
	
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

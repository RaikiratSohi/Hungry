//
//  OfferCell.swift
//  Hungry
//
//  Created by Binwei Yang on 8/18/16.
//  Copyright © 2016 Binwei Yang. All rights reserved.
//

import UIKit

class OfferCell: UITableViewCell {
    
    var offer: Offer! {
        didSet {
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

//
//  OfferCell.swift
//  Hungry
//
//  Created by Binwei Yang on 8/18/16.
//  Copyright © 2016 Binwei Yang. All rights reserved.
//

import UIKit

class OfferCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var foodTypeLabel: UILabel!
    
    
    @IBOutlet weak var pickupAddrLabel: UILabel!
    
    
    @IBOutlet weak var pickupTimeLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var distanceLabel: UILabel!
    
    @IBOutlet weak var offerImage: UIImageView!
    
    var offer: Offer! {
        didSet {
            // TODO replace with title
            titleLabel.text = offer.title
            foodTypeLabel.text = offer.foodType
            priceLabel.text = "$\(offer.price)"
            
            // TODO hide real address
            if (0 == offer.address.lengthOfBytesUsingEncoding(NSUnicodeStringEncoding)) {
                pickupAddrLabel.text = "S Murphy Ave, Sunnyvale"
            }
            else {
                pickupAddrLabel.text = offer.address
            }
            
            // TODO format pick up time
            if (0 == offer.pickupTime.lengthOfBytesUsingEncoding(NSUnicodeStringEncoding)) {
                pickupTimeLabel.text = "Collection time: 17:45-18:00"
            } else {
                pickupTimeLabel.text = "Collection time: \(offer.pickupTime)"
            }
            
            if let imageFile = offer.imageFile {
                imageFile.getDataInBackgroundWithBlock {
                    (imageData: NSData?, error: NSError?) -> Void in
                    if error == nil {
                        if let imageData = imageData {
                            self.offerImage.image = UIImage(data:imageData)
                        }
                    }
                }
            } else {
                offerImage.image = nil
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        titleLabel.preferredMaxLayoutWidth = titleLabel.frame.size.width
    }
    
    override func layoutSubviews() {
        titleLabel.preferredMaxLayoutWidth = titleLabel.frame.size.width
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

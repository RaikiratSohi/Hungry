//
//  OfferDetailViewController.swift
//  Hungry
//
//  Created by Binwei Yang on 8/26/16.
//  Copyright © 2016 Raikirat Sohi. All rights reserved.
//

import UIKit

class OfferDetailViewController: UIViewController {

    var offer: Offer!
    
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodTypeLabel: UILabel!
    @IBOutlet weak var cusineLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var topMarginConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var pickupTimeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = offer.title
        
        if let imageFile = offer.imageFile {
            imageFile.getDataInBackgroundWithBlock {
                (imageData: NSData?, error: NSError?) -> Void in
                if error == nil {
                    if let imageData = imageData {
                        self.foodImageView.image = UIImage(data:imageData)
                        self.view.setNeedsLayout()
                        self.view.layoutIfNeeded()
                     }
                }
            }
        } else {
            foodImageView.image = nil
            topMarginConstraint.constant = 10.0
        }
        
        foodTypeLabel.text = offer.foodType
        cusineLabel.text = offer.cusine
        priceLabel.text = "$\(offer.price)"
        descriptionLabel.text = offer.foodDescription
        
        if (0 == offer.address.lengthOfBytesUsingEncoding(NSUnicodeStringEncoding)) {
            addressLabel.text = "S Murphy Ave, Sunnyvale"
        }
        else {
            addressLabel.text = offer.address
        }
        
        // TODO format pick up time
        if (0 == offer.pickupTime.lengthOfBytesUsingEncoding(NSUnicodeStringEncoding)) {
            pickupTimeLabel.text = "Collection time: 17:45-18:00"
        } else {
            pickupTimeLabel.text = "Collection time: \(offer.pickupTime)"
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

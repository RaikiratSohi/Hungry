//
//  Offer.swift
//  Hungry
//
//  Created by Binwei Yang on 8/15/16.
//  Copyright © 2016 Binwei Yang. All rights reserved.
//

import UIKit
import Parse

class Offer: PFObject, PFSubclassing {
    
    override class func initialize() {
        struct Static {
            static var onceToken : dispatch_once_t = 0;
        }
        dispatch_once(&Static.onceToken) {
            self.registerSubclass()
        }
    }
    
    static func parseClassName() -> String {
        return "Hungry_Offer"
    }
    
    @NSManaged var foodType: String
    
    @NSManaged var title: String
    
    @NSManaged var foodDescription: String
    
    @NSManaged var price: Double
    
    @NSManaged var address: String
    
    @NSManaged var pickupTime: String
    
    @NSManaged var chef: PFUser
    
    @NSManaged var eater: PFUser?
}

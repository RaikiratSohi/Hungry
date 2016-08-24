//
//  ParseClient.swift
//  Hungry
//
//  Created by Binwei Yang on 8/15/16.
//  Copyright © 2016 Binwei Yang. All rights reserved.
//

import UIKit
import Parse

class ParseClient: NSObject {
    static let configuration = ParseClientConfiguration {
        // Add your Parse applicationId:
        $0.applicationId = "hungryios"
        // Uncomment and add your clientKey (it's not required if you are using Parse Server):
        // $0.clientKey = "kfkjfbewjkfb1233124"
        
        // Uncomment the following line and change to your Parse Server address;
        $0.server = "https://hungryios.herokuapp.com/parse"
        
        // Enable storing and querying data from Local Datastore.
        // Remove this line if you don't want to use Local Datastore features or want to use cachePolicy.
        // $0.localDatastoreEnabled = true
    }
    
    static let defaultACL = PFACL ()
    
    class func initializeWithConfiguration() {
        // according to https://parseplatform.github.io/docs/ios/guide/#subclasses
        // do initialize for all the subclasses first
        Offer.initialize()
        
        Parse.initializeWithConfiguration(configuration)
        
        // If you would like all objects to be private by default, remove this line.
        defaultACL.publicReadAccess = true
        PFACL.setDefaultACL(defaultACL, withAccessForCurrentUser: true)
    }
    
    class func queryOffers(limit: Int, orderDescendingByKey key: String?, completion: ([Offer]!, NSError!) -> Void) {
        
        let query = Offer.query()!
        
        query.limit = limit

        if let orderByKey = key {
            query.addDescendingOrder(orderByKey)
        }
        
        query.includeKeys(["chef", "eater", "imageFile"])
        
        query.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error) in
            if (nil == error) {
                if let offers = objects as? [Offer] {
                    completion(offers, error)
                    return
                }
            }
            else {
                NSLog("Got error from queryOffers: \(error?.localizedDescription)")
            }
            completion(nil, error)
        }
    }
}

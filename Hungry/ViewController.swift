//
//  ViewController.swift
//  Hungry
//
//  Created by Raikirat Sohi on 8/11/16.
//  Copyright © 2016 Raikirat Sohi. All rights reserved.
//

import UIKit
import Parse
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let object = PFObject(className: "testObject")
//        object["name"] = "Bill"
//        object["lastname"] = "Alexander"
//        object.saveInBackgroundWithBlock {(done:Bool, error:NSError?) in
//            if done {
//                print("saved in server")
//            }
//            else{
//                print(error)
//            }
//            
//            
//        }
        
//        let offer = Offer()
//        offer.foodType = "Snack"
//        offer.price = 2.5
//        offer.foodDescription = "Chips with salsa"
//        
//        offer.saveInBackgroundWithBlock { (done, error) in
//            if done {
//                print("saved in server")
//            }
//            else{
//                print(error)
//            }
//        }
//
        ParseClient.queryOffers(10, orderDescendingByKey: nil) { (offers, error) in
            if nil != offers {
                print("Got \(offers.count) offers from server")
                print("First offer is \(offers[0].foodDescription) at \(offers[0].price) for \(offers[0].foodType)")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


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
        let object = PFObject(className: "testObject")
        object["name"] = "Bill"
        object["lastname"] = "Alexander"
        object.saveInBackgroundWithBlock {(done:Bool, error:NSError?) in
            if done {
                print("saved in server")
            }
            else{
                print(error)
            }
            
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


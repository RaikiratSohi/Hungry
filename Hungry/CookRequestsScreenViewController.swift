//
//  CookRequestsScreenViewController.swift
//  Hungry
//
//  Created by Raikirat Sohi on 8/27/16.
//  Copyright © 2016 Raikirat Sohi. All rights reserved.
//

import UIKit

class CookRequestsScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    //Mark ACTIONS
    
    @IBAction func AddNewFoodEntry(sender: AnyObject) {
        
        self.performSegueWithIdentifier("newfood" , sender: self)
    }

}

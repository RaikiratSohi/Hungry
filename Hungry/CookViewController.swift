//
//  CookViewController.swift
//  Hungry
//
//  Created by Abhinav Mathur on 8/16/16.
//  Copyright © 2016 Raikirat Sohi. All rights reserved.
//

import UIKit

class CookViewController: UIViewController {

    @IBOutlet weak var titleField: UITextField!
    
    @IBOutlet weak var priceField: UITextField!
    
    @IBOutlet weak var typeField: UITextField!
    
    @IBOutlet weak var descriptionField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onSubmitAction(sender: AnyObject) {
        let offer = Offer()
        offer.title = titleField.text ?? ""
        //offer.price = priceField.text ?? 0.0
        offer.foodType = typeField.text ?? ""
        offer.foodDescription = descriptionField.text ?? ""
        
        offer.saveInBackgroundWithBlock { (done, error) in
                    if done {
                        print("saved in server")
                   }
                    else{
                        print(error)
                    }
                }

        
        
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

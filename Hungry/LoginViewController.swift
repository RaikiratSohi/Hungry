//
//  LoginViewController.swift
//  Hungry
//
//  Created by Raikirat Sohi on 8/16/16.
//  Copyright © 2016 Raikirat Sohi. All rights reserved.
//

import UIKit
import Parse
class LoginViewController: UIViewController {

    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    var actInd: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0,0,150,150)) as UIActivityIndicatorView
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.actInd.center = self.view.center
        
        self.actInd.hidesWhenStopped = true
        
        self.actInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        view.addSubview(self.actInd)
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

    //MARK: Actions
    
    @IBAction func loginAction(sender: AnyObject) {
        
        var username = self.usernameField.text
        var password = self.passwordField.text
        

        
        
        if( username?.characters.count < 4 || password?.characters.count < 4 ){
            var alert = UIAlertView(title:"Invalid", message: "Password must be gretaer than 5.", delegate: self, cancelButtonTitle: "OK")
            alert.show()
        }
        else{
        self.actInd.startAnimating()
            PFUser.logInWithUsernameInBackground(username!, password: password!, block: { (user, error) ->
                Void in
                
                self.actInd.startAnimating()
                
                if((user) != nil){
                    var alert = UIAlertView(title:"Success", message: "logged in", delegate: self, cancelButtonTitle: "OK")
                    alert.show()
                    self.performSegueWithIdentifier("loginswitch" , sender: self)
                }
                else{
                    var alert = UIAlertView(title:"Error", message: "\(error)", delegate: self, cancelButtonTitle: "OK")
                    alert.show()
                    
                }
                
            

            
            
            })
        }
        
    }
    @IBAction func signupAction(sender: AnyObject) {
        self.performSegueWithIdentifier("signup", sender: self)
    }
    
}

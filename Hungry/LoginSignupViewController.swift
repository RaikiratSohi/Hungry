//
//  LoginSignupViewController.swift
//  Hungry
//
//  Created by Raikirat Sohi on 8/16/16.
//  Copyright © 2016 Raikirat Sohi. All rights reserved.
//

import UIKit
import Parse
import ParseUI



class LoginSignupViewController: UIViewController, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate{

    var loginViewController: PFLogInViewController! = PFLogInViewController()
    var signUpViewController: PFSignUpViewController! = PFSignUpViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if(PFUser.currentUser() == nil){
        
            self.loginViewController.fields = [.UsernameAndPassword , .LogInButton , .SignUpButton ,.PasswordForgotten ,.DismissButton]
            
            let logInLogoTitle = UILabel()
            logInLogoTitle.text = "Hungry"
            
            self.loginViewController.logInView?.logo = logInLogoTitle
            self.loginViewController.delegate = self
            let signUpLogoTitle = UILabel()
            signUpLogoTitle.text = "Hungry"
            
            self.signUpViewController.signUpView?.logo = signUpLogoTitle
            self.signUpViewController.delegate = self
            self.loginViewController.signUpController = self.signUpViewController
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
    //MARK : PARSE LOGIN
    func loginViewController(logInController: PFLogInViewController!, shouldBeginLoginWithUsername username: String!, password: String!) -> Bool {
        if(!username.isEmpty || !password.isEmpty){
            return true
            }
        else {
        return false
        }
    }
    
    func loginViewController(logInController: PFLogInViewController!, didLogInUser user: PFUser!){
         self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func loginViewController(logInController: PFLogInViewController!, didFailLogInWithError error: NSError!){
        print("Failed to Login")
    }
    
    
    //MARK : PARSE SIGNUP
    
    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    func signUpViewControllerDidCancelSignUp(signUpController: PFSignUpViewController) {
        print("User dismissed sign up")
    }
    func signUpViewController(signUpController: PFSignUpViewController, didFailToSignUpWithError error: NSError?) {
        print("Failed to sign up")
    }
    
    //MARK : ACTIONS
    
   
    @IBAction func LoginSignupAction(sender: AnyObject){
        self.performSegueWithIdentifier("login" , sender: self)
    }
}

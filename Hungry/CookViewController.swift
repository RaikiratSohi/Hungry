//
//  CookViewController.swift
//  Hungry
//
//  Created by Abhinav Mathur on 8/16/16.
//  Copyright © 2016 Raikirat Sohi. All rights reserved.
//

import UIKit
import Parse

class CookViewController: UIViewController,UIImagePickerControllerDelegate,
UINavigationControllerDelegate,UIPickerViewDataSource,UIPickerViewDelegate {

    @IBOutlet weak var titleField: UITextField!
    
    @IBOutlet weak var priceField: UITextField!
   
   // @IBOutlet weak var typeField: UITextField!
    
    @IBOutlet weak var descriptionField: UITextView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var mealPicker: UIPickerView!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var cusineField: UITextField!
    
    @IBOutlet weak var addressField: UITextView!
    
    var mealType = ["Breakfast","Lunch","Dinner"]
    var selectedMealType = "";
    
    var pickupDate = "";
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Search", style: .Plain, target: nil, action: nil)
        
        mealPicker.dataSource = self
        mealPicker.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onCameraButton(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            var imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera;
            imagePicker.allowsEditing = false
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
    
    }
    
    
    @IBAction func onDatePickerAction(sender: AnyObject) {
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        var strDate = dateFormatter.stringFromDate(datePicker.date)
        pickupDate = strDate
        
        
    }
    
    
    @IBAction func onGalleryButton(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
            var imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary;
            imagePicker.allowsEditing = true
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
    
    
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return mealType.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return mealType[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedMealType = mealType[row]
    }
    
    
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        imageView.image = image
        self.dismissViewControllerAnimated(true, completion: nil);
    }
    
    @IBAction func onSubmitAction(sender: AnyObject) {
        let offer = Offer()
        offer.title = titleField.text ?? ""
        //offer.price = priceField.text ?? 0.0
        offer.foodType = selectedMealType
        offer.foodDescription = descriptionField.text ?? ""
        offer.pickupTime = pickupDate
        offer.cusine = cusineField.text ?? ""
        offer.address = addressField.text ?? ""
        
        let imageData = UIImagePNGRepresentation(imageView.image!)
        offer.imageFile = PFFile(name:"image.png", data:imageData!)
        
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

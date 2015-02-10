//
//  DontHaveAppointmentViewController.swift
//  RoboBetty
//
//  Created by Brian Chin on 2/9/15.
//  Copyright (c) 2015 CSE112-GoldTeam. All rights reserved.
//

import UIKit

class DontHaveAppointmentViewController: UIViewController, UIPickerViewDelegate, UITextFieldDelegate {

    @IBOutlet var doneButton: UIButton!
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var dateOfBirthTextField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    var dateFormatter = NSDateFormatter()
    var dateInLabel: NSDate!
    
    override func viewDidLoad() {
        //let backItem = UIBarButtonItem(title: "Back", style: .Bordered, target: nil, action: nil)
        //navigationItem.backBarButtonItem = backItem
        
        super.viewDidLoad()
        doneButton.backgroundColor = UIColor (red:0.29, green:0.863, blue:0.369, alpha:1)
        doneButton.layer.borderColor = UIColor.whiteColor().CGColor
        doneButton.layer.cornerRadius = 5
        doneButton.layer.borderWidth = 1
        
        datePicker.datePickerMode = UIDatePickerMode.Date
        datePicker.hidden = true
        datePicker.maximumDate = NSDate()
        datePicker.addTarget(self, action: Selector("handleDatePicker:"), forControlEvents: UIControlEvents.ValueChanged)
        
        dateFormatter.dateFormat = "MM/dd/yyyy"
        dateInLabel = NSDate()
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = false
        firstNameTextField.text = ""
        lastNameTextField.text = ""
        dateOfBirthTextField.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldDidBeginEditing(textField: UITextField) {
        if textField == dateOfBirthTextField{
            dateOfBirthTextField.resignFirstResponder()
            datePicker.hidden = false
            dateOfBirthTextField.text = dateFormatter.stringFromDate(dateInLabel)
        }
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
        datePicker.hidden = true
    }
    
    func handleDatePicker(sender: UIDatePicker) {
        dateInLabel = sender.date
        dateOfBirthTextField.text = dateFormatter.stringFromDate(dateInLabel)
    }
}

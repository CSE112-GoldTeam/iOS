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
    //@IBOutlet var picker: UIPickerView? = UIPickerView()
    var datePicker: UIDatePicker = UIDatePicker()
    
    /*var months = ["January", "February", "March", "April", "May", "June",
        "July", "August", "September", "October", "November", "December"]
    
    var days = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12",
    "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25",
    "26", "27", "28", "29", "30", "31"]*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doneButton.backgroundColor = UIColor (red:0.29, green:0.863, blue:0.369, alpha:1)
        doneButton.layer.borderColor = UIColor.whiteColor().CGColor
        doneButton.layer.cornerRadius = 5
        doneButton.layer.borderWidth = 1
        
        datePicker.datePickerMode = UIDatePickerMode.Date
        dateOfBirthTextField.inputView = datePicker
        //datePicker.hidden = true
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = false
        // set title
        self.title = "Don't Have An Appointment?"
        firstNameTextField.text = ""
        lastNameTextField.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        if(textField == dateOfBirthTextField){
            //datePicker.hidden = false
        }
        else{
            return true
        }
        return true
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

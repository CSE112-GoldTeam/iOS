//
//  ThankYouViewController.swift
//  RoboBetty
//
//  Created by Brian Fong on 2/9/15.
//  Copyright (c) 2015 CSE112-GoldTeam. All rights reserved.
//

import UIKit

class ThankYouViewController: UIViewController {

    @IBOutlet var okButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        okButton.backgroundColor = UIColor (red:0.29, green:0.863, blue:0.369, alpha:1)
        okButton.layer.borderColor = UIColor.whiteColor().CGColor
        okButton.layer.cornerRadius = 5
        okButton.layer.borderWidth = 1
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
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

}

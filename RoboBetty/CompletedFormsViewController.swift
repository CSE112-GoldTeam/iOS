//
//  CompletedFormsViewController.swift
//  RoboBetty
//
//  Created by Mike Griffin on 2/9/15.
//  Copyright (c) 2015 CSE112-GoldTeam. All rights reserved.
//

import UIKit

class CompletedFormsViewController: UIViewController {

    @IBOutlet weak var submitFormsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        submitFormsButton.backgroundColor = UIColor (red:0.29, green:0.863, blue:0.369, alpha:1)
        submitFormsButton.layer.borderColor = UIColor.whiteColor().CGColor
        submitFormsButton.layer.cornerRadius = 5
        submitFormsButton.layer.borderWidth = 1
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

//
//  RBAPIManager.swift
//  RoboBetty
//
//  Created by Ryan Khalili on 2/10/15.
//  Copyright (c) 2015 CSE112-GoldTeam. All rights reserved.
//

public let RBAPILoggedInNotificationKey  = "RoboBetty Logged In"
public let RBAPILoggedOutNotificationKey = "RoboBetty Logged Out"

private let SharedManager = RBAPIManager()
private let URL = "http://robobetty-dev.herokuapp.com/api/m/appointment"

import Foundation
import Alamofire

class RBAPIManager
{
    private var accessToken: String?
    
    class var manager: RBAPIManager
    {
        return SharedManager
    }
    
    init()
    {
        accessToken = NSUserDefaults.standardUserDefaults().objectForKey( "token" ) as? String
    }
    
    
    
    func isLoggedIn() -> Bool
    {
        return accessToken != nil
    }
    
    func login( username: String!, password: String!, completion: ( success: Bool ) -> () )
    {
        accessToken = "temp"
        NSNotificationCenter.defaultCenter().postNotificationName( RBAPILoggedInNotificationKey, object: nil )
    }
    
    func logout()
    {
        accessToken = nil
    }
    
    func getAppointmentInfo(fName:NSString, lName:NSString, dob:NSString, completionHandler: (responseObject: NSMutableDictionary?) -> ()){
        Alamofire.request(.GET, URL, parameters: ["fname": fName, "lname": lName, "dob":dob], encoding: .URL).responseJSON { (_, _, JSON, _) in
            if let jsonResult = JSON as? Array<Dictionary<String,String>> {
                if(jsonResult.count == 0){
                    completionHandler(responseObject: nil)
                }
                else{
                    var information = NSMutableDictionary()
                    let email = jsonResult[0]["email"]
                    information.setValue(fName, forKey: "fname")
                    information.setValue(lName, forKey: "lname")
                    information.setValue(dob, forKey: "dob")
                    information.setValue(email, forKey: "email")
                    completionHandler(responseObject: information)
                }
            }
        }
    }
    
}
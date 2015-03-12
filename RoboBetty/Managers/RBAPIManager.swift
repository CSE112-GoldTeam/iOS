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
private let baseURL = "http://robobetty-dev.herokuapp.com/api/m/"

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
    
    private func saveAccessToken( token: String )
    {
        accessToken = token
        NSUserDefaults.standardUserDefaults().setObject( token, forKey: "token" )
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func isLoggedIn() -> Bool
    {
        return accessToken != nil
    }
    
    func login( username: String!, password: String!, completion: ( success: Bool ) -> () )
    {
        //accessToken = "temp"
        let url = "http://robobetty-dev.herokuapp.com/api/auth"
        
        let plainString = "\(username):\(password)" as NSString
        let plainData = plainString.dataUsingEncoding( NSUTF8StringEncoding )
        let base64String = plainData?.base64EncodedStringWithOptions( nil )
        
        let authHeader = [ "Authorization": "Basic " + base64String! ]
        Alamofire.Manager.sharedInstance.session.configuration.HTTPAdditionalHeaders = authHeader
        
        Alamofire.request( .POST, url ).response
        {
            request, response, data, error in
            
            if error == nil
            {
                let str = NSString( data: data as NSData, encoding: NSUTF8StringEncoding )
                
                if str == "Unauthorized"
                {
                    completion( success: false )
                }
                else
                {
                    let json = NSJSONSerialization.JSONObjectWithData( data as NSData, options: nil, error: nil ) as? NSDictionary
                    
                    if json == nil
                    {
                        completion( success: false )
                    }
                    else
                    {
                        let token = json!.objectForKey( "api_token" ) as String
                        self.saveAccessToken( token )
                        completion( success: true )
                    }
                }
            }
            else
            {
                println( error )
                completion( success: false )
            }
        }
    }
    
    func logout()
    {
        accessToken = nil
        NSUserDefaults.standardUserDefaults().removeObjectForKey( "token" )
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func getAppointmentInfo( fName: NSString, lName: NSString, dob: NSString, completionHandler: ( responseObject: NSMutableDictionary? ) -> () )
    {
        let url = baseURL + "appointment"
        let parameters = [
            "fname": fName,
            "lname": lName,
            "dob":   dob
        ]
        
        Alamofire.request( .GET, url, parameters: parameters, encoding: .URL ).responseJSON
        {
            request, response, json, error in
            
            if let jsonResult = json as? Array<Dictionary<String,String>>
            {
                if jsonResult.count == 0
                {
                    completionHandler( responseObject: nil )
                }
                else
                {
                    var information = NSMutableDictionary()
                    let email = jsonResult[0]["email"]
                    let apptID = jsonResult[0]["_id"]
                    NSLog( "%@", jsonResult[0] as NSDictionary )
                    information.setValue(fName, forKey: "fname")
                    information.setValue(lName, forKey: "lname")
                    information.setValue(dob, forKey: "dob")
                    information.setValue(email, forKey: "email")
                    information.setValue(apptID, forKey: "appointmentID")
                    completionHandler( responseObject: information )
                }
            }
            else
            {
                completionHandler( responseObject: nil )
            }
        }
    }
    
    func sendSignature( signature: String, forAppointmentID appointmentID: String, completion: ( success: Bool ) -> () )
    {
        var dispatchTime: dispatch_time_t = dispatch_time( DISPATCH_TIME_NOW, Int64( 3 * Double( NSEC_PER_SEC ) ) )
        dispatch_after( dispatchTime, dispatch_get_main_queue(),
        {
            completion( success: true )
        })
    }
}
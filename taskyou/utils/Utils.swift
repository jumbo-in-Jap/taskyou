//
//  Utils.swift
//  taskyou
//
//

import UIKit

let SERVICE_NAME = "taskyou"
let KEYCHAIN_USER_NAME = "keychain_name"

class Utils: NSObject {
    
    // method to save keychain
    class func secureValueForKey(key:String)->String
    {
       return SSKeychain.passwordForService(SERVICE_NAME, account: key)
    }
    
    // User name
    class func setUserName(name:String)
    {
        SSKeychain.setPassword(name, forService: SERVICE_NAME, account: KEYCHAIN_USER_NAME)
    }
    
    class func getUserName()->String
    {
        return self.secureValueForKey(KEYCHAIN_USER_NAME)
    }
    
    class func isLogin()->Bool
    {
        return self.getUserName() != nil
    }
        
}

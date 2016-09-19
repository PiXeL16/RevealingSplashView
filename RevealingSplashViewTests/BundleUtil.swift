//
//  BundleUtil.swift
//  RevealingSplashView
//
//  Created by Christopher Jimenez on 2/26/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import Foundation


/// Get the Pod Bundle
open class BundleUtil:NSObject{
    
    
    /// Gets the bundle property for the pod
    open static var bundle:Bundle{
        
        get{
            
            //Get the bundle
            var bundle = Bundle(for: self.classForCoder())
            
            //Trys to load the path to resource(In case we are calling this from the pod)
            if let bundlePath:String = bundle.path(forResource: "RevealingSplashViewTests", ofType: "bundle")
            {
                //If we get the path to resource, set the bundle path
                bundle =  Bundle(path: bundlePath)!
                
            }
            
            return bundle
        }
    }
    
    
}

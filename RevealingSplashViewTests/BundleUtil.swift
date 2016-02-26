//
//  BundleUtil.swift
//  RevealingSplashView
//
//  Created by Christopher Jimenez on 2/26/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import Foundation


/// Get the Pod Bundle
public class BundleUtil:NSObject{
    
    
    /// Gets the bundle property for the pod
    public static var bundle:NSBundle{
        
        get{
            
            //Get the bundle
            var bundle = NSBundle(forClass: self.classForCoder())
            
            //Trys to load the path to resource(In case we are calling this from the pod)
            if let bundlePath:String = bundle.pathForResource("RevealingSplashViewTests", ofType: "bundle")
            {
                //If we get the path to resource, set the bundle path
                bundle =  NSBundle(path: bundlePath)!
                
            }
            
            return bundle
        }
    }
    
    
}

//
//  Animatable.swift
//  RevealingSplashView
//
//  Created by Chris Jimenez on 2/25/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import Foundation
import UIKit


public protocol SplashAnimatable: class{
    
    
    var imageView: UIImageView? { get set }
    
    var animationType: AnimationType { get set }
    
    var duration: Double { get set }
    
    var delay: Double { get set }
    
}


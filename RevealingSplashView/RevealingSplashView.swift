//
//  RevealingSplashView.swift
//  RevealingSplashView
//
//  Created by Chris Jimenez on 2/25/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import Foundation
import UIKit


/// SplashView that reveals its content and animate, like twitter
public class RevealingSplashView: UIView, SplashAnimatable{
    
    
    public var iconImage: UIImage? {
        
        didSet{
            if let iconImage = self.iconImage{
                imageView?.image = iconImage.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            }
        }
        
    }
    public var iconColor: UIColor = UIColor.whiteColor(){
        
        didSet{
            
             imageView?.tintColor = iconColor
        }
            
    }
    public var iconInitialSize: CGSize = CGSizeMake(60, 60) {
        
        didSet{
            
             imageView?.frame = CGRect(x: 0, y: 0, width: iconInitialSize.width, height: iconInitialSize.height)
        }
    }
    
    public var imageView: UIImageView?
    
    public var animationType: AnimationType = AnimationType.Twitter
    
    public var duration: Double = 1.0
    
    public var delay: Double = 0.5
    
    public init(iconImage: UIImage, backgroundColor: UIColor)
    {
       
        self.imageView = UIImageView()
        self.iconImage = iconImage
        
        super.init(frame: UIScreen.mainScreen().bounds)
        
        imageView?.image = iconImage.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        imageView?.tintColor = iconColor
        imageView?.frame = CGRect(x: 0, y: 0, width: iconInitialSize.width, height: iconInitialSize.height)
        imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        imageView?.center = self.center
        
        self.addSubview(imageView!)
        
        self.backgroundColor = backgroundColor
        
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

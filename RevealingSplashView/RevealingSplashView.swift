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
open class RevealingSplashView: UIView, SplashAnimatable{
    
    
    /// The icon image to show and reveal with
    open var iconImage: UIImage? {
        
        didSet{
            if let iconImage = self.iconImage{
                imageView?.image = iconImage
            }
        }
        
    }
    
    ///The icon color of the image, defaults to white
    open var iconColor: UIColor = UIColor.white{
        
        didSet{
            
             imageView?.tintColor = iconColor
        }
            
    }
    
    open var useCustomIconColor: Bool = false{
        
        didSet{
            
            if(useCustomIconColor == true){

                if let iconImage = self.iconImage {
                    imageView?.image = iconImage.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
                }
            }
            else{
                
                if let iconImage = self.iconImage {
                    imageView?.image = iconImage.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
                }
            }
        }
    }
    
    ///The initial size of the icon. Ideally it has to match with the size of the icon in your LaunchScreen Splash view
    open var iconInitialSize: CGSize = CGSize(width: 60, height: 60) {
        
        didSet{
            
             imageView?.frame = CGRect(x: 0, y: 0, width: iconInitialSize.width, height: iconInitialSize.height)
        }
    }
    
    /// The image view containing the background Image
    open var backgroundImageView: UIImageView?
    
    /// THe image view containing the icon Image
    open var imageView: UIImageView?
    
    /// The type of animation to use for the. Defaults to the twitter default animation
    open var animationType: SplashAnimationType = SplashAnimationType.twitter
    
    /// The duration of the animation, default to 1.5 seconds. In the case of heartBeat animation recommended value is 3
    open var duration: Double = 1.5
    
    /// The delay of the animation, default to 0.5 seconds
    open var delay: Double = 0.5
    
    /// The boolean to stop the heart beat animation, default to false (continuous beat)
    open var heartAttack: Bool = false
    
    /// The repeat counter for heart beat animation, default to 1
    open var minimumBeats: Int = 1
    
    /**
     Default constructor of the class
     
     - parameter iconImage:       The Icon image to show the animation
     - parameter iconInitialSize: The initial size of the icon image
     - parameter backgroundColor: The background color of the image, ideally this should match your Splash view
     
     - returns: The created RevealingSplashViewObject
     */
    public init(iconImage: UIImage, iconInitialSize:CGSize, backgroundColor: UIColor)
    {
        //Sets the initial values of the image view and icon view
        self.imageView = UIImageView()
        self.iconImage = iconImage
        self.iconInitialSize = iconInitialSize
        //Inits the view to the size of the screen
        super.init(frame: (UIScreen.main.bounds))
        
        imageView?.image = iconImage
        imageView?.tintColor = iconColor
        //Set the initial size and position
        imageView?.frame = CGRect(x: 0, y: 0, width: iconInitialSize.width, height: iconInitialSize.height)
        //Sets the content mode and set it to be centered
        imageView?.contentMode = UIViewContentMode.scaleAspectFit
        imageView?.center = self.center
        
        //Adds the icon to the view
        self.addSubview(imageView!)
        
        //Sets the background color
        self.backgroundColor = backgroundColor
        
    }
    
    public init(iconImage: UIImage, iconInitialSize:CGSize, backgroundImage: UIImage)
    {
        //Sets the initial values of the image view and icon view
        self.imageView = UIImageView()
        self.iconImage = iconImage
        self.iconInitialSize = iconInitialSize
        //Inits the view to the size of the screen
        super.init(frame: (UIScreen.main.bounds))
        
        imageView?.image = iconImage
        imageView?.tintColor = iconColor
        //Set the initial size and position
        imageView?.frame = CGRect(x: 0, y: 0, width: iconInitialSize.width, height: iconInitialSize.height)
        //Sets the content mode and set it to be centered
        imageView?.contentMode = UIViewContentMode.scaleAspectFit
        imageView?.center = self.center
        
        //Sets the background image
        self.backgroundImageView = UIImageView()
        backgroundImageView?.image = backgroundImage
        backgroundImageView?.frame = UIScreen.main.bounds
        backgroundImageView?.contentMode = UIViewContentMode.scaleAspectFill
        
        self.addSubview(backgroundImageView!)
        
        //Adds the icon to the view
        self.addSubview(imageView!)
        
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//
//  Animations.swift
//  RevealingSplashView
//
//  Created by Chris Jimenez on 2/26/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import Foundation



// MARK: - Protool extension to define the basic functionality for the SplashAnimatable
public extension SplashAnimatable where Self: UIView {
    
    /**
     Starts the animation depending on the type
     */
    public func startAnimation()
    {
        switch animationType{
        case .Twitter:
            playTwitterAnimation()
        }
    }
    
    
    /**
     Plays the twitter animation
     */
    public func playTwitterAnimation()
    {
        
        if let imageView = self.imageView {
            
            //Define the shink and grow duration based on the duration parameter
            let shrinkDuration: NSTimeInterval = duration * 0.5
            let growDuration: NSTimeInterval =  duration * 0.6
            
            //Plays the shrink animation
            UIView.animateWithDuration(shrinkDuration, delay: delay, usingSpringWithDamping: 0.7, initialSpringVelocity: 10, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                //Shrinks the image
                let scaleTransform: CGAffineTransform = CGAffineTransformMakeScale(0.75,0.75)
                imageView.transform = scaleTransform
                
                //When animation completes, grow the image
                }, completion: { finished in
                    
                    UIView.animateWithDuration(growDuration, animations:{
                        
                        
                        let scaleTransform: CGAffineTransform = CGAffineTransformMakeScale(20, 20)
                        imageView.transform = scaleTransform
                        self.alpha = 0
                        
                        //When animation completes remote self from super view
                        }, completion: { finished in
                            
                            self.removeFromSuperview()
                    })
            })
        }
    }
    
    
}

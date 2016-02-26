//
//  Animations.swift
//  RevealingSplashView
//
//  Created by Chris Jimenez on 2/26/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import Foundation


public typealias SplashAnimatableCompletion = () -> Void
public typealias SplashAnimatableExecution = () -> Void

// MARK: - Protool extension to define the basic functionality for the SplashAnimatable
public extension SplashAnimatable where Self: UIView {
    
    /**
     Starts the animation depending on the type
     */
    public func startAnimation(completion: SplashAnimatableCompletion? = nil)
    {
        switch animationType{
        case .Twitter:
            playTwitterAnimation(completion)
            
        case .RotateOut:
            playRotateOutAnimation(completion)
            
        case .WoobleAndZoomOut:
            playWoobleAnimation(completion)
            
        case .SwingAndZoomOut:
            playSwingAnimation(completion)
            
        case.PopAndZoomOut:
            playPopAnimation(completion)
            
        case.SqueezeAndZoomOut:
            playSqueezeAnimation(completion)
        }
        
    }
    
    
    /**
     Plays the twitter animation
     */
    public func playTwitterAnimation(completion: SplashAnimatableCompletion? = nil)
    {
        
        if let imageView = self.imageView {
            
            //Define the shink and grow duration based on the duration parameter
            let shrinkDuration: NSTimeInterval = duration * 0.3
            
            //Plays the shrink animation
            UIView.animateWithDuration(shrinkDuration, delay: delay, usingSpringWithDamping: 0.7, initialSpringVelocity: 10, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                //Shrinks the image
                let scaleTransform: CGAffineTransform = CGAffineTransformMakeScale(0.75,0.75)
                imageView.transform = scaleTransform
                
                //When animation completes, grow the image
                }, completion: { finished in
                    
                    self.playZoomOutAnimation(completion)
            })
        }
    }
    
    
    /**
     Plays the twitter animation
     */
    public func playSqueezeAnimation(completion: SplashAnimatableCompletion? = nil)
    {
        
        if let imageView = self.imageView {
            
            //Define the shink and grow duration based on the duration parameter
            let shrinkDuration: NSTimeInterval = duration * 0.5
            
            //Plays the shrink animation
            UIView.animateWithDuration(shrinkDuration, delay: delay/3, usingSpringWithDamping: 10, initialSpringVelocity: 10, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                //Shrinks the image
                let scaleTransform: CGAffineTransform = CGAffineTransformMakeScale(0.30,0.30)
                imageView.transform = scaleTransform
                
                //When animation completes, grow the image
                }, completion: { finished in
                    
                    self.playZoomOutAnimation(completion)
            })
        }
    }
    
    /**
     Plays the rotate out animation
     
     - parameter completion: when the animation completes
     */
    public func playRotateOutAnimation(completion: SplashAnimatableCompletion? = nil)
    {
        if let imageView = self.imageView{
            
            /**
            Sets the animation with duration delay and completion
            
            - returns:
            */
            UIView.animateWithDuration(duration, delay: delay, usingSpringWithDamping: 0.5, initialSpringVelocity: 3, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                
                //Sets a simple rotate
                let rotateTranform = CGAffineTransformMakeRotation(CGFloat(M_PI * 0.99))
                //Mix the rotation with the zoom out animation
                imageView.transform = CGAffineTransformConcat(rotateTranform, self.getZoomOutTranform())
                //Removes the animation
                self.alpha = 0
                
                }, completion: { finished in
                    
                    self.removeFromSuperview()
                    
                    completion?()
            })
            
        }
    }
    
    /**
     Plays a wobble animtion and then zoom out
     
     - parameter completion: completion
     */
    public func playWoobleAnimation(completion: SplashAnimatableCompletion? = nil) {
        
        if let imageView = self.imageView{
            
            let woobleForce = 0.5
            
            animateLayer({
                let rotation = CAKeyframeAnimation(keyPath: "transform.rotation")
                rotation.values = [0, 0.3 * woobleForce, -0.3 * woobleForce, 0.3 * woobleForce, 0]
                rotation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
                rotation.additive = true
                
                let positionX = CAKeyframeAnimation(keyPath: "position.x")
                positionX.values = [0, 30 * woobleForce, -30 * woobleForce, 30 * woobleForce, 0]
                positionX.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
                positionX.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
                positionX.additive = true
                
                let animationGroup = CAAnimationGroup()
                animationGroup.animations = [rotation, positionX]
                animationGroup.duration = CFTimeInterval(self.duration/2)
                animationGroup.beginTime = CACurrentMediaTime() + CFTimeInterval(self.delay/2)
                animationGroup.repeatCount = 2
                imageView.layer.addAnimation(animationGroup, forKey: "wobble")
                }, completion: {
                    
                     self.playZoomOutAnimation(completion)
            })
            
        }
    }
    
    /**
     Plays the swing animation and zoom out
     
     - parameter completion: completion
     */
    public func playSwingAnimation(completion: SplashAnimatableCompletion? = nil)
    {
        if let imageView = self.imageView{
            
            let swingForce = 0.8
            
            animateLayer({
                
                let animation = CAKeyframeAnimation(keyPath: "transform.rotation")
                animation.values = [0, 0.3 * swingForce, -0.3 * swingForce, 0.3 * swingForce, 0]
                animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
                animation.duration = CFTimeInterval(self.duration/2)
                animation.additive = true
                animation.repeatCount = 2
                animation.beginTime = CACurrentMediaTime() + CFTimeInterval(self.delay/3)
                imageView.layer.addAnimation(animation, forKey: "swing")
                
                }, completion: {
                    self.playZoomOutAnimation(completion)
            })
        }
    }
    
    
    /**
     Plays the pop animation with completion
     
     - parameter completion: completion
     */
    public func playPopAnimation(completion: SplashAnimatableCompletion? = nil)
    {
        if let imageView = self.imageView{
            
            let popForce = 0.5
            
            animateLayer({
                let animation = CAKeyframeAnimation(keyPath: "transform.scale")
                animation.values = [0, 0.2 * popForce, -0.2 * popForce, 0.2 * popForce, 0]
                animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
                animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
                animation.duration = CFTimeInterval(self.duration/2)
                animation.additive = true
                animation.repeatCount = 2
                animation.beginTime = CACurrentMediaTime() + CFTimeInterval(self.delay/2)
                imageView.layer.addAnimation(animation, forKey: "pop")
                }, completion: {
                     self.playZoomOutAnimation(completion)
            })
        }
    }
    
    /**
     Plays the zoom out animation with completion
     
     - parameter completion: completion
     */
    public func playZoomOutAnimation(completion: SplashAnimatableCompletion? = nil)
    {
        if let imageView =  imageView
        {
            let growDuration: NSTimeInterval =  duration * 0.3
            
            UIView.animateWithDuration(growDuration, animations:{
                
                imageView.transform = self.getZoomOutTranform()
                self.alpha = 0
                
                //When animation completes remote self from super view
                }, completion: { finished in
                    
                    self.removeFromSuperview()
                    
                    completion?()
            })
        }
    }
    
    
    
    /**
     Retuns the default zoom out transform to be use mixed with other transform
     
     - returns: ZoomOut fransfork
     */
    private func getZoomOutTranform() -> CGAffineTransform
    {
        let zoomOutTranform: CGAffineTransform = CGAffineTransformMakeScale(20, 20)
        return zoomOutTranform
    }
    
    
    // MARK: - Private
    private func animateLayer(animation: SplashAnimatableExecution, completion: SplashAnimatableCompletion? = nil) {
        
        CATransaction.begin()
        if let completion = completion {
            CATransaction.setCompletionBlock { completion() }
        }
        animation()
        CATransaction.commit()
    }
    
    
    
}

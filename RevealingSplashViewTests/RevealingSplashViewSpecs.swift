//
//  RevealingSplashViewSpecs.swift
//  RevealingSplashView
//
//  Created by Christopher Jimenez on 2/26/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import Foundation
import Nimble
import Quick
import RevealingSplashView
import UIKit


//Specs for the revealingSplashView class and basic functionality
class RevealingSplashViewSpecs: QuickSpec {
    
    override func spec() {
        
        let iconImage = UIImage(named: "twitterLogo", inBundle: BundleUtil.bundle, compatibleWithTraitCollection: nil)!
        
        let revealingSplashView = RevealingSplashView(iconImage: iconImage, iconInitialSize: CGSizeMake(50, 50), backgroundColor: UIColor.redColor())
        
        
        it("is valid with initial data"){
            
            revealingSplashView.duration = 1.0
            revealingSplashView.delay  = 1.0
            revealingSplashView.iconColor = UIColor.whiteColor()
            revealingSplashView.iconImage = iconImage
            revealingSplashView.iconInitialSize = CGSizeMake(30, 30)
            
            
            expect(revealingSplashView).notTo(beNil())
            expect(revealingSplashView.animationType).to(equal(SplashAnimationType.Twitter))
            expect(revealingSplashView.imageView?.tintColor).to(equal(UIColor.whiteColor()))
        }
        
        it("completes with completion at duration") {
                
                revealingSplashView.duration = 3
                
                var completed = false
                revealingSplashView.startAnimation() {
                        completed = true
                }
                
                expect(completed).toEventually(beTrue(),timeout:3)
                
        }
        
        it("pop animation completes") {
                
                revealingSplashView.animationType = SplashAnimationType.PopAndZoomOut
                
                revealingSplashView.duration = 3
                
                var completed = false
                revealingSplashView.startAnimation() {
                        completed = true
                }
                
                expect(revealingSplashView.animationType).to(equal(SplashAnimationType.PopAndZoomOut))
                expect(completed).toEventually(beTrue(),timeout:3)
                
        }
        
        it("squeeze animation completes") {
                
                revealingSplashView.animationType = SplashAnimationType.SqueezeAndZoomOut
                
                revealingSplashView.duration = 3
                
                var completed = false
                revealingSplashView.startAnimation() {
                        completed = true
                }
                
            expect(revealingSplashView.animationType).to(equal(SplashAnimationType.SqueezeAndZoomOut))
            expect(completed).toEventually(beTrue(),timeout:3)
                
        }
        
        it("Rotate out animation completes") {
                
                revealingSplashView.animationType = SplashAnimationType.RotateOut
                
                revealingSplashView.duration = 3
                
                var completed = false
                revealingSplashView.startAnimation() {
                        completed = true
                }
                
            expect(revealingSplashView.animationType).to(equal(SplashAnimationType.RotateOut))
            expect(completed).toEventually(beTrue(),timeout:3)
                
        }
        
        
        it("Wobble out animation completes") {
            
            revealingSplashView.animationType = SplashAnimationType.WoobleAndZoomOut
            
            revealingSplashView.duration = 1
            
            var completed = false
            revealingSplashView.startAnimation() {
                    completed = true
            }
            
            expect(revealingSplashView.animationType).to(equal(SplashAnimationType.WoobleAndZoomOut))
            expect(completed).toEventually(beTrue(),timeout:1)
            
        }
        
        
        it("Swing out animation completes") {
            
            revealingSplashView.animationType = SplashAnimationType.SwingAndZoomOut
            
            revealingSplashView.duration = 2
            
            var completed = false
            revealingSplashView.startAnimation() {
                    completed = true
            }
            
            expect(revealingSplashView.animationType).to(equal(SplashAnimationType.SwingAndZoomOut))
            expect(completed).toEventually(beTrue(),timeout:2)
            
        }
        
        
    }
    
}
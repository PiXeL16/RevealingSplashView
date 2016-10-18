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
        
        let iconImage = UIImage(named: "twitterLogo", in: BundleUtil.bundle, compatibleWith: nil)!
        
        let revealingSplashView = RevealingSplashView(iconImage: iconImage, iconInitialSize: CGSize(width: 50, height: 50), backgroundColor: UIColor.red)
        
        
        it("is valid with initial data"){
            
            revealingSplashView.duration = 1.0
            revealingSplashView.delay  = 1.0
            revealingSplashView.iconColor = UIColor.white
            revealingSplashView.useCustomIconColor = true
            revealingSplashView.iconImage = iconImage
            
            revealingSplashView.iconInitialSize = CGSize(width: 30, height: 30)
            
            
            expect(revealingSplashView).notTo(beNil())
            expect(revealingSplashView.animationType).to(equal(SplashAnimationType.twitter))
        
            expect(revealingSplashView.imageView?.tintColor).to(equal(UIColor.white))
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
                
                revealingSplashView.animationType = SplashAnimationType.popAndZoomOut
                
                revealingSplashView.duration = 3
                
                var completed = false
                revealingSplashView.startAnimation() {
                        completed = true
                }
                
                expect(revealingSplashView.animationType).to(equal(SplashAnimationType.popAndZoomOut))
                expect(completed).toEventually(beTrue(),timeout:3)
                
        }
        
        it("squeeze animation completes") {
                
                revealingSplashView.animationType = SplashAnimationType.squeezeAndZoomOut
                
                revealingSplashView.duration = 3
                
                var completed = false
                revealingSplashView.startAnimation() {
                        completed = true
                }
                
            expect(revealingSplashView.animationType).to(equal(SplashAnimationType.squeezeAndZoomOut))
            expect(completed).toEventually(beTrue(),timeout:3)
                
        }
        
        it("Rotate out animation completes") {
                
                revealingSplashView.animationType = SplashAnimationType.rotateOut
                
                revealingSplashView.duration = 3
                
                var completed = false
                revealingSplashView.startAnimation() {
                        completed = true
                }
                
            expect(revealingSplashView.animationType).to(equal(SplashAnimationType.rotateOut))
            expect(completed).toEventually(beTrue(),timeout:3)
                
        }
        
        
        it("Wobble out animation completes") {
            
            revealingSplashView.animationType = SplashAnimationType.woobleAndZoomOut
            
            revealingSplashView.duration = 1
            
            var completed = false
            revealingSplashView.startAnimation() {
                    completed = true
            }
            
            expect(revealingSplashView.animationType).to(equal(SplashAnimationType.woobleAndZoomOut))
            expect(completed).toEventually(beTrue(),timeout:1)
            
        }
        
        
        it("Swing out animation completes") {
            
            revealingSplashView.animationType = SplashAnimationType.swingAndZoomOut
            
            revealingSplashView.duration = 2
            
            var completed = false
            revealingSplashView.startAnimation() {
                    completed = true
            }
            
            expect(revealingSplashView.animationType).to(equal(SplashAnimationType.swingAndZoomOut))
            expect(completed).toEventually(beTrue(),timeout:2)
            
        }
        
        
    }
    
}

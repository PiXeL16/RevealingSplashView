//
//  ViewController.swift
//  RevealingSplashViewSample
//
//  Created by Chris Jimenez on 2/25/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import UIKit
import RevealingSplashView

class ViewController: UIViewController {

    let revealingSplashView = RevealingSplashView(iconImage: UIImage(named: "twitterLogo")!,iconInitialSize: CGSize(width: 70, height: 70), backgroundColor: UIColor(rgba:"#1D8FF1"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.addSubview(revealingSplashView)
        
        revealingSplashView.duration = 3
        
        revealingSplashView.iconColor = UIColor.white
        revealingSplashView.useCustomIconColor = false
        
        revealingSplashView.animationType = SplashAnimationType.HeartBeat

        revealingSplashView.startAnimation(){
            
            print("Completed")
        }

        // Simulate a network call finishing in 30 seconds... (think loading PokemonGo!)
        Timer.scheduledTimer(timeInterval: 13, target: self, selector: #selector(update), userInfo: nil, repeats: false)
   
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // stop the heart beat animation
    func update(){
        revealingSplashView.finishHeartBeatAnimation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


![Banner](/Web/banner.png)

[![Build Status](https://travis-ci.org/PiXeL16/RevealingSplashView.svg?branch=master)](https://travis-ci.org/PiXeL16/RevealingSplashView/) [![codecov.io](https://codecov.io/github/PiXeL16/RevealingSplashView/coverage.svg?branch=master)](https://codecov.io/github/PiXeL16/RevealingSplashView?branch=master) [![CocoaPods Compatible](https://img.shields.io/cocoapods/v/RevealingSplashView.svg)](https://img.shields.io/cocoapods/v/RevealingSplashView.svg) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) [![Awesome](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg)](https://github.com/matteocrippa/awesome-swift) [![Language](https://img.shields.io/badge/language-Swift%203.0-orange.svg)](https://swift.org) [![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/PiXeL16/RevealingSplashView/master/LICENSE)

# RevealingSplashView
A Splash view that animates and reveals its content, inspired by the `Twitter` splash.

![RevealingSplashView](/Web/revealingSplashView.gif)

:star: Features
---
* Customizable reveal icon image.
* Customizable icon image color.
* Customizable icon image size.
* Customizable background color.
* Customizable animation duration.
* Customizable animation delay.
* Several animation to choose from.
* Easy to use :wink:.

:octocat: Installation
---
Get `RevealingSplashView` on CocoaPods, just add `pod 'RevealingSplashView'` to your `Podfile` and then run `pod install`. You can also add the github to your `Carthage` file.

If you use `Carthage` you can just install it by adding `github "PiXeL16/RevealingSplashView"` to your `Carthage` file.

### Using Swift 2.3?
If you are using Swift 2.3, please use the `0.0.6` release.

:metal: Usage
---
Usage is pretty easy, just initialize your `RevealingSplashView` in your entry `ViewController` and in your `viewDidLoad()` function add it to your view. Then call `startAnimation()`:

```swift
import RevealingSplashView

override func viewDidLoad() {
        super.viewDidLoad()

        //Initialize a revealing Splash with with the iconImage, the initial size and the background color
        let revealingSplashView = RevealingSplashView(iconImage: UIImage(named: "twitterLogo")!,iconInitialSize: CGSize(width: 70, height: 70), backgroundColor: UIColor(red:0.11, green:0.56, blue:0.95, alpha:1.0))

        //Adds the revealing splash view as a sub view
        self.view.addSubview(revealingSplashView)

        //Starts animation
        revealingSplashView.startAnimation(){
            print("Completed")
        }

    }
```

**Ideally** your `iconInitialSize` should match the size of the icon in your `LaunchScreen.storyboard`.

So it you set your constrains in your `LaunchScreen.storyboard` to be 80 `height` and 80 `width` you should set the same size as the initial size of the `RevealingSplashView`

### Custom Icon Color
You are also able to change the color of your `iconImage`.

```swift
import RevealingSplashView

override func viewDidLoad() {
        super.viewDidLoad()
        
        //Initialize a revealing Splash with with the iconImage, the initial size and the background color
        let revealingSplashView = RevealingSplashView(iconImage: UIImage(named: "twitterLogo")!,iconInitialSize: CGSize(width: 70, height: 70), backgroundColor: UIColor(red:0.11, green:0.56, blue:0.95, alpha:1.0))

        revealingSplashView.useCustomIconColor = true
        revealingSplashView.iconColor = UIColor.red

        //Adds the revealing splash view as a sub view
        self.view.addSubview(revealingSplashView)

        //Starts animation
        revealingSplashView.startAnimation(){
            print("Completed")
        }

    }
```
This will change the actual icon color to red before the animation.

### Custom Background Image
You are also able to change the background image of your `backgroundImage`.

```swift
import RevealingSplashView

override func viewDidLoad() {
        super.viewDidLoad()
        
        //Initialize a revealing Splash with with the iconImage, the initial size and the background color
        let revealingSplashView = RevealingSplashView(iconImage: UIImage(named: "twitterLogo")!, iconInitialSize: CGSize(width: 70, height: 70), backgroundImage: UIImage(named: "BackgroundImage")!)

        revealingSplashView.useCustomIconColor = false
        revealingSplashView.iconColor = UIColor.red

        //Adds the revealing splash view as a sub view
        self.view.addSubview(revealingSplashView)

        //Starts animation
        revealingSplashView.startAnimation(){
            print("Completed")
        }

    }
```

### Using NavigationBar or TabBar?
If you are using a `NavigationBar` or `TabBar` as your entry view controller, chances are that the animation will look offset by some pixels.
There are a couple of options here:
Instead of adding the `RevealingSplashView` to your ViewController, you can add it to your `window`.
```
let window = UIApplication.sharedApplication().keyWindow
window?.addSubview(revealingSplashView)
```

You can also create `another` entry view controller. Then add the `RevealingSplashView` to that ViewController instead of the one with the `NavigationBar` or `TabBar`.
Then after the animation of the `RevealingSplashView` ends you can transition to your NavigationViewController.


:thumbsup: Animations Types
----
There are several animations to choose from just set the `animationType` property of the `RevealingSplashView`

### Twitter

Its the default animation that `Twitter` use for their app. If `animationType` is not set it will default to this one.

![RevealingSplashView](/Web/revealingSplashView.gif)

### HeartBeat
HeartBeat like animation, unlike the other animations, this `special` animation allows you to continue to animate until a function its called.
This could be more entertaining to the user than having a quick launch and waiting on a spinning wheel if the app needs to fetch more data.

![HeartBeatAnimation](/Web/heartBeat.gif)

### Rotate Out

Similar to the `Twitter` one but rotating while zooming out.

```swift

revealingSplashView.animationType = SplashAnimationType.rotateOut
```
![RotateOutAnimation](/Web/rotateAndZoomOut.gif)

### Pop and Zoom Out

Pop the view a couple of times and zoom out.

```swift

revealingSplashView.animationType = SplashAnimationType.popAndZoomOut
```
![RotateOutAnimation](/Web/popAndZoomOut.gif)

### Squeeze and Zoom Out

Squeeze the view and zoom out.

```swift

revealingSplashView.animationType = SplashAnimationType.squeezeAndZoomOut
```
![RotateOutAnimation](/Web/squeezeAndZoomOut.gif)

### Swing and Zoom Out

Swings the view and zoom out.

```swift

revealingSplashView.animationType = SplashAnimationType.swingAndZoomOut
```
![RotateOutAnimation](/Web/swingAndZoomOut.gif)

### Wobble and Zoom Out

Wobbles the view and zoom out.

```swift

revealingSplashView.animationType = SplashAnimationType.wobbleAndZoomOut
```
![RotateOutAnimation](/Web/wobbleAndZoomOut.gif)

TODO
-----
* Better code coverage
* More animations

:alien: Author
------
Chris Jimenez - http://code.chrisjimenez.net, [@chrisjimeneznat](http://twitter.com/chrisjimeneznat)

:beer: Donate
------
If you want to buy me a beer, you can donate to my coin addresses below:
#### BTC
1BeGBew4CBdLgUSmvoyiU1LrM99GpkXgkj
#### ETH
0xa59a3793E3Cb5f3B1AdE6887783D225EDf67192d
#### LTC
Ld6FB3Tqjf6B8iz9Gn9sMr7BnowAjSUXaV

## License
`RevealingSplashView` is released under the MIT license. See [LICENSE](https://github.com/pixel16/RevealingSplashView/blob/master/LICENSE) for details.

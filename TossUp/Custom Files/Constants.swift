//
//  Constants.swift
//  TossUp
//
//  Created by Carter Burzlaff on 8/4/20.
//  Copyright © 2020 Carter Burzlaff. All rights reserved.
//

import UIKit

let maps = [
    "Dust 2",
    "Mirage",
    "Inferno",
    "Cache",
    "Overpass",
    "Train",
    "Nuke",
    "Vertigo"
]

let awsURLPrefix = "https://tossup-video-storage.s3.us-east-2.amazonaws.com/"
let testInterstitialAdID = "ca-app-pub-3940256099942544/4411468910"
let testInterstitialVideoAdID = "ca-app-pub-3940256099942544/5135589807"
let interstitialAdID = "ca-app-pub-4948364110248472/3219097697"
//my adMob appID: ca-app-pub-4948364110248472~8201092563

let titleSize: CGFloat = 17.5
let titleFont: String = "OpenSans-SemiBold"
var nextVC: UIViewController?
let headerHeight: CGFloat = 40

class CustomUINavigationController: UINavigationController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .init(arrayLiteral: .portrait, .portraitUpsideDown)
    }
}

//
//  BoardingScreen.swift
//  SwiftUIAnimationTutorials
//
//  Created by Hamit Seyrek on 5.03.2022.
// do something

import SwiftUI

struct BoardingScreen: Identifiable {
    var id = UUID().uuidString
    var image: String
    var title: String
    var description: String
}
// Since image name and BG color name are same....
// Sample Model SCreens....
var boardingScreens: [BoardingScreen] = [
    BoardingScreen(image: "codemLogoBlackRed", title: "CodemVia Community", description: "A volunteer-based social responsibility project."),
    BoardingScreen(image: "hamit", title: "Hamit Seyrek", description: "iOS Developer {SwiftUI, UIKit, XCode, SceneKit, ARKit ...}"),
    BoardingScreen(image: "swiftUILogo", title: "SwiftUI Animation Tutorials", description: "This application contains animation application examples made with SwiftUI."),
]

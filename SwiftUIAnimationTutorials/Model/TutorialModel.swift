//
//  Album.swift
//  SwiftUIAnimationTutorials
//
//  Created by Hamit Seyrek on 6.03.2022.
//

import SwiftUI

struct TutorialModel {
    var name: String
    var animationView: AnyView
    var keys: String
    var image: String
}
var view = AnyView(WawesView())
var tutorials = [
    TutorialModel(name: "Wawes", animationView: AnyView(WawesView()), keys: "Passenger", image: "hamit"),
    TutorialModel(name: "Gears and Belts", animationView: AnyView(GearsAndBeltsView()), keys: "Taylor Swift", image: "hamit"),
    TutorialModel(name: "Wifi Loading", animationView: AnyView(WifiLoadingView()), keys: "Kurt Hugo Schneider", image: "hamit"),
    TutorialModel(name: "Light Switch", animationView: AnyView(LightSwitchView()), keys: "DJ Snake", image: "hamit"),
    TutorialModel(name: "Expand Button", animationView: AnyView(ExpandButtonView()), keys: "Ed Sherran", image: "hamit"),
    TutorialModel(name: "Heart Animate", animationView: AnyView(HeartAnimateView()), keys: "Taylor Swift", image: "hamit"),
    TutorialModel(name: "Weather Graph Animation", animationView: AnyView(WeatherGraphAnimationView()), keys: "Camila Cabello", image: "hamit"),
    TutorialModel(name: "Twinkling Stars", animationView: AnyView(TwinklingStarsView()), keys: "Taylor Swift", image: "hamit"),
    TutorialModel(name: "Swinging", animationView: AnyView(SwingingView()), keys: "J Balvin", image: "hamit"),
    TutorialModel(name: "Elevator App", animationView: AnyView(ElevatorAppView()), keys: "Camila Cabello", image: "hamit"),
    TutorialModel(name: "Parallax Effect", animationView: AnyView(ParallaxEffectView()), keys: "Lady Gaga", image: "hamit"),
    TutorialModel(name: "Fly Present Dismiss Transition", animationView: AnyView(FlyPresentDismissTransitionView()), keys: "Kay Perry", image: "hamit"),
    TutorialModel(name: "Huge Rotation", animationView: AnyView(HugeRotationView()), keys: "Maren Morris", image: "hamit"),
    TutorialModel(name: "Bubble SpriteKit", animationView: AnyView(BubbleSpriteKitView()), keys: "Katy Perry", image: "hamit"),
    TutorialModel(name: "Flying Bird", animationView: AnyView(FlyingBirdView()), keys: "Camila Cabello", image: "hamit"),
    TutorialModel(name: "Breathing Flower", animationView: AnyView(BreathingFlowerView()), keys: "Lady Gaga", image: "hamit"),
    TutorialModel(name: "FunColor Rotation", animationView: AnyView(FunColorRotationView()), keys: "Kay Perry", image: "hamit"),
    TutorialModel(name: "Record Player", animationView: AnyView(RecordPlayerView()), keys: "Maren Morris", image: "hamit"),
    TutorialModel(name: "Circle", animationView: AnyView(CircleView()), keys: "Katy Perry", image: "hamit"),
]

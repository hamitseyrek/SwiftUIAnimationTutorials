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
    TutorialModel(name: "WifiLoadingView", animationView: AnyView(WifiLoadingView()), keys: "Kurt Hugo Schneider", image: "hamit"),
    TutorialModel(name: "LightSwitchView", animationView: AnyView(LightSwitchView()), keys: "DJ Snake", image: "hamit"),
    TutorialModel(name: "ExpandButtonView", animationView: AnyView(ExpandButtonView()), keys: "Ed Sherran", image: "hamit"),
    TutorialModel(name: "HeartAnimateView", animationView: AnyView(HeartAnimateView()), keys: "Taylor Swift", image: "hamit"),
    TutorialModel(name: "WeatherGraphAnimationView", animationView: AnyView(WeatherGraphAnimationView()), keys: "Camila Cabello", image: "hamit"),
    TutorialModel(name: "TwinklingStarsView", animationView: AnyView(TwinklingStarsView()), keys: "Taylor Swift", image: "hamit"),
    TutorialModel(name: "SwingingView", animationView: AnyView(SwingingView()), keys: "J Balvin", image: "hamit"),
    TutorialModel(name: "ElevatorAppView", animationView: AnyView(ElevatorAppView()), keys: "Camila Cabello", image: "hamit"),
    TutorialModel(name: "ParallaxEffectView", animationView: AnyView(ParallaxEffectView()), keys: "Lady Gaga", image: "hamit"),
    TutorialModel(name: "FlyPresentDismissTransitionView", animationView: AnyView(FlyPresentDismissTransitionView()), keys: "Kay Perry", image: "hamit"),
    TutorialModel(name: "HugeRotationView", animationView: AnyView(HugeRotationView()), keys: "Maren Morris", image: "hamit"),
    TutorialModel(name: "BubbleSpriteKitView", animationView: AnyView(BubbleSpriteKitView()), keys: "Katy Perry", image: "hamit"),
    TutorialModel(name: "FlyingBirdView", animationView: AnyView(FlyingBirdView()), keys: "Camila Cabello", image: "hamit"),
    TutorialModel(name: "BreathingFlowerView", animationView: AnyView(BreathingFlowerView()), keys: "Lady Gaga", image: "hamit"),
    TutorialModel(name: "FunColorRotationView", animationView: AnyView(FunColorRotationView()), keys: "Kay Perry", image: "hamit"),
    TutorialModel(name: "RecordPlayerView", animationView: AnyView(RecordPlayerView()), keys: "Maren Morris", image: "hamit"),
    TutorialModel(name: "CircleView", animationView: AnyView(CircleView()), keys: "Katy Perry", image: "hamit"),
]

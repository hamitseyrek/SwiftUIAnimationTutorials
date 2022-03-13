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
    TutorialModel(name: "Gears and Belts", animationView: AnyView(GearsAndBeltsView()), keys: "{animation, gears, belts...}", image: "GearsAndBeltsView"),
    TutorialModel(name: "Wifi Loading", animationView: AnyView(WifiLoadingView()), keys: "{animation, wifi, loading...}", image: "WifiLoadingView"),
    TutorialModel(name: "Light Switch", animationView: AnyView(LightSwitchView()), keys: "{animation, light switch, change color...}", image: "LightSwitchView"),
    TutorialModel(name: "Expand Button", animationView: AnyView(ExpandButtonView()), keys: "{animation, expand, button...}", image: "ExpandButtonView"),
    TutorialModel(name: "Heart Animate", animationView: AnyView(HeartAnimateView()), keys: "{animation, heart, light line...}", image: "HeartAnimateView"),
    TutorialModel(name: "Weather Graph", animationView: AnyView(WeatherGraphAnimationView()), keys: "{animation, weather, graph, sun, moon, toggle...}", image: "WeatherGraphAnimationView"),
    TutorialModel(name: "Twinkling Stars", animationView: AnyView(TwinklingStarsView()), keys: "{animation, twinkling starts, closer...}", image: "TwinklingStarsView"),
    TutorialModel(name: "Swinging", animationView: AnyView(SwingingView()), keys: "{animation, swinging...}", image: "SwingingView"),
    TutorialModel(name: "Slide Card", animationView: AnyView(SlideCardView()), keys: "{animation, slide card, expanded...}", image: "SlideCardView"),
    TutorialModel(name: "Elevator App", animationView: AnyView(ElevatorAppView()), keys: "{animation, elevator, open close door...}", image: "ElevatorAppView"),
    TutorialModel(name: "Parallax Effect", animationView: AnyView(ParallaxEffectView()), keys: "{animation, parallax, effect...}", image: "ParallaxEffectView"),
    TutorialModel(name: "Wawes", animationView: AnyView(WawesView()), keys: "{animation, wawes, upanddown, audio player...}", image: "WawesView"),
    TutorialModel(name: "Fly And Dismiss", animationView: AnyView(FlyPresentDismissTransitionView()), keys: "{animation, fly present, dissmiss, view, transition...}", image: "FlyPresentDismissTransitionView"),
    TutorialModel(name: "Huge Rotation", animationView: AnyView(HugeRotationView()), keys: "{animation, huge, rotation, color...}", image: "HugeRotationView"),
    TutorialModel(name: "Bubble SpriteKit", animationView: AnyView(BubbleSpriteKitView()), keys: "{animation, spritekit, bubble, game, scene...}", image: "BubbleSpriteKitView"),
    TutorialModel(name: "Flying Bird", animationView: AnyView(FlyingBirdView()), keys: "{animation, flying, bird...}", image: "FlyingBirdView"),
    TutorialModel(name: "Breathing Flower", animationView: AnyView(BreathingFlowerView()), keys: "{animation, breathing, flower...}", image: "BreathingFlowerView"),
    TutorialModel(name: "FunColor Rotation", animationView: AnyView(FunColorRotationView()), keys: "{animation, funcolor, rotation...}", image: "FunColorRotationView"),
    TutorialModel(name: "Record Player", animationView: AnyView(RecordPlayerView()), keys: "{animation, record, player, music...}", image: "RecordPlayerView"),
    TutorialModel(name: "Circle Animation", animationView: AnyView(CircleAnimationView()), keys: "{animation, circle...}", image: "CircleAnimationView"),
]

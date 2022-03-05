//
//  WawesView.swift
//  SwiftUIAnimationTutorials
//
//  Created by Hamit Seyrek on 2.03.2022.
//

import SwiftUI

struct WawesView: View {
    @State private var animateOffset = false
    @State private var tiltForwardBackward = false
    @State private var upAndDown = false
    @State private var leadingAnchorAnimnate = false
    
    var body: some View {
        ZStack {
            //MARK: - BACKGROUND
            Color.blue.opacity(0.5).edgesIgnoringSafeArea(.all)
            
            //MARK: - WAVE 1
            ZStack (alignment: .top) {
                WaveCreation(animateOffset: $animateOffset, animatableOffsetTrue: 0.1, animatableOffsetFalse: -0.1, radius: 50, shawdowX: 0, shawdowY: 50, duration: 2.7, locationOffsetY: -300)
            }
            
            //MARK: - WAVE 2
            ZStack () {
                WaveCreation(animateOffset: $animateOffset, animatableOffsetTrue: -0.1, animatableOffsetFalse: 0.1, radius: 40, shawdowX: 0, shawdowY: 10, duration: 2.5, locationOffsetY: -350)
            }
            
            //MARK: - WAVE 3
            ZStack () {
                WaveCreation(animateOffset: $animateOffset, animatableOffsetTrue: 0.1, animatableOffsetFalse: -0.2, radius: 30, shawdowX: 0, shawdowY: 10, duration: 2.3, locationOffsetY: -400)
            }
            
            BuoyView(tiltForwardBackward: $tiltForwardBackward, upAndDown: $upAndDown, leadingAnchorAnimate: $leadingAnchorAnimnate)
                .offset(y: -10)
            
            //MARK: - WAVE 4
            ZStack () {
                WaveCreation(animateOffset: $animateOffset, animatableOffsetTrue: 0.2, animatableOffsetFalse: -0.1, radius: 20, shawdowX: 0, shawdowY: 10, duration: 2.7, locationOffsetY: -405)
            }
            
            //MARK: - WAVE 5
            ZStack () {
                WaveCreation(animateOffset: $animateOffset, animatableOffsetTrue: -0.2, animatableOffsetFalse: 0.2, radius: 10, shawdowX: 0, shawdowY: 10, duration: 2.2, locationOffsetY: -410)
            }
            
            //MARK: - WAVE 6
            ZStack () {
                WaveCreation(animateOffset: $animateOffset, animatableOffsetTrue: -0.1, animatableOffsetFalse: 0.2, radius: 5, shawdowX: 0, shawdowY: 5, duration: 2.8, locationOffsetY: -410)
            }
            
            //MARK: - WAVE 7
            ZStack () {
                WaveCreation(animateOffset: $animateOffset, animatableOffsetTrue: 0.1, animatableOffsetFalse: -0.1, radius: 25, shawdowX: 0, shawdowY: 40, duration: 2.1, locationOffsetY: -500)
            }
            
            //MARK: - WAVE 8
            ZStack () {
                WaveCreation(animateOffset: $animateOffset, animatableOffsetTrue: -0.2, animatableOffsetFalse: 0.1, radius: 50, shawdowX: 0, shawdowY: 50, duration: 2.9, locationOffsetY: -600)
                    .opacity(0.8)
            }
            
        }.onAppear() {
            animateOffset.toggle()
            
            //MARK: - we use PlaySound file  RecordPlaye folder for sound play
            playSound(sound: "buoyBells", type: "m4a")
        }.onDisappear(){
            audioPlayer?.stop()
        }
    }
}

struct WaveCreation: View {
    @Binding var animateOffset: Bool
    var animatableOffsetTrue: CGFloat
    var animatableOffsetFalse: CGFloat
    var radius: CGFloat
    var shawdowX: CGFloat
    var shawdowY: CGFloat
    var duration: Double
    var locationOffsetY: CGFloat
    
    var body: some View {
        WaveView(yOffset: animateOffset ? animatableOffsetTrue : animatableOffsetFalse)
            .fill(Color(UIColor.blue)).shadow(color: .gray, radius: radius, x: shawdowX, y: shawdowY)
            .animation(Animation.easeInOut(duration: duration).repeatForever(autoreverses: true), value: animateOffset)
            .offset(y: locationOffsetY).rotationEffect(.degrees(180))
    }
}


struct WawesView_Previews: PreviewProvider {
    static var previews: some View {
        WawesView()
    }
}

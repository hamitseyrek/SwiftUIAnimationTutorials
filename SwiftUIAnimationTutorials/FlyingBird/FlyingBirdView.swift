//
//  FlyingBirdView.swift
//  SwiftUIAnimationTutorials
//
//  Created by Hamit Seyrek on 25.02.2022.
//

import SwiftUI

struct FlyingBirdView: View {
    
    @State private var leftWing = false
    @State private var rightWing = false
    @State private var birdBody = false
    @State private var animateText = false
    @State private var animateShadow = false
    
    var body: some View {
        ZStack{
            Color(red: 0.0, green: 0.0, blue: 0.0).edgesIgnoringSafeArea(.all)
            
            //MARK: - LOGO
            Text("FLYING BIRD")
                .font(.largeTitle)
                .foregroundColor(.white)
                .offset(y: -250)
                .scaleEffect(animateText ? 1.1 : 1.0)
                .animation(Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: animateText ? 1.1 : 1.0)
            
            ZStack{
                
                //MARK: - LEFT WING
                Image("leftWing").resizable().frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .shadow(color: .red, radius: 1, x: 0, y: 3)
                    .rotationEffect(.degrees(leftWing ? -100 : 0), anchor: .bottomTrailing)
                    .offset(x: -55, y: leftWing ? -190 : 0)
                    .animation(Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: leftWing ? -190 : 0)
                
                //MARK: - RIGHT WING
                Image("rightWing").resizable().frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .shadow(color: .blue, radius: 1, x: 0, y: 3)
                    .rotationEffect(.degrees(rightWing ? 100 : 0), anchor: .bottomLeading)
                    .offset(x: 55, y: rightWing ? -190 : 0)
                    .animation(Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: rightWing ? -190 : 0)
                
                //MARK: - BODY
                Image("body").resizable()
                    .frame(width: 125, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .offset(y: -30)
                    .shadow(color: .white, radius: 1, x: 0, y: 0)
                    .offset(y: birdBody ? -50 : 75)
                    .animation(Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: birdBody ? -50 : 75)
            }
            .shadow(color: .white, radius: animateShadow ? 1 : 4, x: 0, y: animateShadow ? 10 : 1)
            .animation(Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: animateShadow ? 10 : 1)
            .onAppear(perform: {
                leftWing.toggle()
                rightWing.toggle()
                birdBody.toggle()
                animateText.toggle()
                animateShadow.toggle()
            })
        }
    }
}

struct FlyingBirdView_Previews: PreviewProvider {
    static var previews: some View {
        FlyingBirdView()
    }
}

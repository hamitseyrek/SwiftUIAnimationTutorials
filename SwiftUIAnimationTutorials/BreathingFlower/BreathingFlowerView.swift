//
//  BreathingFlower.swift
//  SwiftUIAnimationTutorials
//
//  Created by Hamit Seyrek on 25.02.2022.
//

import SwiftUI

struct BreathingFlowerView: View {
    
    @State private var petal = false
    @State private var showShadow = false
    @State private var breathInLabel = true
    @State private var breathOutLabel = false
    @State private var breath = false
    @State private var diffuseOnExhale = false
    let backgroundColor = Color(UIColor.black)
    @State private var degrees: CGFloat = 0.0
    
    var body: some View {
        ZStack{
            backgroundColor.edgesIgnoringSafeArea(.all)
            
            //MARK: - TEXT LABELS
            ZStack{
                
                Text("Breath In")
                    .font(Font.custom("papyrus", size: 35))
                    .foregroundColor(Color(UIColor.green))
                    .opacity(breathInLabel ? 0 : 1)
                    .scaleEffect(breathInLabel ? 0 : 1)
                    .offset(y: -160)
                    .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: -160)
                
                Text("Breath Out")
                    .font(Font.custom("papyrus", size: 35))
                    .foregroundColor(Color(UIColor.orange))
                    .opacity(breathOutLabel ? 0 : 1)
                    .scaleEffect(breathOutLabel ? 0 : 1)
                    .offset(y: -160)
                    .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: -160)
                
                VStack{
                    ZStack{
                        VStack{
                            //MARK: - BREATH
                            Image("breath")
                                .resizable()
                                .frame(width: 35, height: 125)
                                .offset(y: breath ? 90 : 0)
                                .animation(Animation.timingCurve(0.65, -2.6, 0.32, 0.4).delay(0.05).speed(0.1).repeatForever(autoreverses: true), value: breath)
                        }
                        .blur(radius: diffuseOnExhale ? 1 : 60)
                        .offset(x: 0, y: diffuseOnExhale ? -50 : -100)
                        
                        
                        //MARK - PETALS
                        ///left petal
                        Petal(petal: $petal, degrees: petal ? -25 : -5)
                        
                        ///middle petal
                        Image("flower")
                            .resizable()
                            .frame(width: 75, height: 125, alignment: .center)
                        
                        ///right petal
                        Petal(petal: $petal, degrees: petal ? 25 : 5)
                        
                        ///far left petal
                        Petal(petal: $petal, degrees: petal ? -50 : -10)
                        
                        ///far right petal
                        Petal(petal: $petal, degrees: petal ? 50 : 10)
                        
                        ///first bottom flowers
                        Image("bottomFlowers")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 400, alignment: .center)
                            .rotationEffect(.degrees(37))
                            .offset(x: -25, y: 90)
                        
                        Image("bottomFlowers")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .rotationEffect(.degrees(32))
                            .offset(x: -20, y: 190)
                    }
                    .shadow(radius: showShadow ? 20 : 0)
                    .hueRotation(Angle(degrees: showShadow ? 0 : 180))
                    .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: showShadow)
                }
            }.offset(y: -100)
            
        }.onAppear(perform: {
            showShadow.toggle()
            petal.toggle()
            breathInLabel.toggle()
            breathOutLabel.toggle()
            breath.toggle()
            diffuseOnExhale.toggle()
        })
        
    }
}

struct Petal: View {
    
    @Binding var petal: Bool
    var degrees: Double = 0.0
    
    var body: some View {
        Image("flower")
            .resizable()
            .frame(width: 75, height: 125)
            .rotationEffect(.degrees(petal ? degrees : degrees), anchor: .bottom)
            .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: petal)
    }
}

struct BreathingFlower_Previews: PreviewProvider {
    static var previews: some View {
        BreathingFlowerView()
    }
}

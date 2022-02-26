//
//  CircleView.swift
//  SwiftUIAnimationTutorials
//
//  Created by Hamit Seyrek on 24.02.2022.
//

import SwiftUI

struct CircleView: View {
    
    @State private var scaleInOut = false
    @State private var rotateInOut = false
    @State private var moveInOut = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .edgesIgnoringSafeArea(.all)
            ZStack {
                
                //MARK: - Cicle Set 1
                ZStack {
                    Circle().fill(LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 120, height: 120)
                        .offset(y: moveInOut ? -60 : 0)
                    
                    Circle().fill(LinearGradient(gradient: Gradient(colors: [.blue, .white]), startPoint: .bottom, endPoint: .top))
                        .frame(width: 120, height: 120)
                        .offset(y: moveInOut ? 60 : 0)
                }.opacity(0.5)
                
                //MARK: - Cicle Set 2
                ZStack {
                    Circle().fill(LinearGradient(gradient: Gradient(colors: [.blue, .white]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 120, height: 120)
                        .offset(y: moveInOut ? -60 : 0)
                    
                    Circle().fill(LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .bottom, endPoint: .top))
                        .frame(width: 120, height: 120)
                        .offset(y: moveInOut ? 60 : 0)
                }.opacity(0.5)
                    .rotationEffect(.degrees(60))
                
                //MARK: - Cicle Set 1
                ZStack {
                    Circle().fill(LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 120, height: 120)
                        .offset(y: moveInOut ? -60 : 0)
                    
                    Circle().fill(LinearGradient(gradient: Gradient(colors: [.blue, .white]), startPoint: .bottom, endPoint: .top))
                        .frame(width: 120, height: 120)
                        .offset(y: moveInOut ? 60 : 0)
                }.opacity(0.5)
                    .rotationEffect(.degrees(120))
                
            }
            .rotationEffect(.degrees(rotateInOut ? 90 : 0))
            .scaleEffect(scaleInOut ? 1 : 1/4)
            .animation(Animation.easeInOut.repeatForever(autoreverses: true).speed(1/8), value: scaleInOut)
            .onAppear {
                moveInOut.toggle()
                scaleInOut.toggle()
                rotateInOut.toggle()
            }
        }
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView()
    }
}

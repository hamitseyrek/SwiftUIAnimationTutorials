//
//  BuoyView.swift
//  SwiftUIAnimationTutorials
//
//  Created by Hamit Seyrek on 2.03.2022.
//

import SwiftUI

struct BuoyView: View {
    @Binding var tiltForwardBackward: Bool
    @Binding var upAndDown: Bool
    @Binding var leadingAnchorAnimate: Bool
    
    var body: some View {
        ZStack {
            Image("buoy")
                .overlay(
                    Rectangle()
                        .overlay(leadingAnchorAnimate ? Color(red: 1.0,green: 1.0,blue: 1.0) : Color(red: 0.5,green: 0.5,blue: 0.5)).cornerRadius(5).frame(width: 11, height: 16).position(x: 112.5, y: 20))
                .animation(Animation.easeOut(duration: 1).repeatForever(autoreverses: true), value: leadingAnchorAnimate)
            
                .rotationEffect(.degrees(leadingAnchorAnimate ? 7 : -3), anchor: .leading)
                .animation(Animation.easeOut(duration: 0.9).repeatForever(autoreverses: true), value: leadingAnchorAnimate)
            
                .rotationEffect(.degrees(tiltForwardBackward ? -20 : 15))
                .offset(y: upAndDown ? -10 : 10)
                .animation(Animation.easeInOut(duration: 1.0).delay(0.2).repeatForever(autoreverses: true), value: upAndDown)
            
                .onAppear() {
                    tiltForwardBackward.toggle()
                    upAndDown.toggle()
                    leadingAnchorAnimate.toggle()
                }
        }
    }
}

struct BuoyView_Previews: PreviewProvider {
    static var previews: some View {
        BuoyView(tiltForwardBackward: .constant(true), upAndDown: .constant(true), leadingAnchorAnimate: .constant(true))
    }
}

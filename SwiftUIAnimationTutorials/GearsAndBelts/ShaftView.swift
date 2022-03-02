//
//  ShaftView.swift
//  SwiftUIAnimationTutorials
//
//  Created by Hamit Seyrek on 2.03.2022.
//

import SwiftUI

struct ShaftView: View {
    var width: CGFloat = 0.0
    var motionOffsetX: CGFloat = 0.0
    var motionOffsetY: CGFloat = 0.0
    @State var animateRect: Bool = false
    
    var body: some View {
        
        ZStack {
            Image("shaft").resizable()
                .frame(width: width, height: 40)
            ShaftMotionView(motionWidth: width - 30, motonOffsetY: -7)
        }
    }
}

struct ShaftMotionView: View {
    var motionWidth: CGFloat = 0.0
    var motionOffsetX: CGFloat = 0.0
    var motonOffsetY: CGFloat = 0.0
    @State private var animateRect: Bool = false
    
    var body: some View {
        ZStack {
            Rectangle().frame(width: motionWidth, height: 8)
                .foregroundColor(.black)
                .cornerRadius(5)
                .opacity(animateRect ? 0 : 0.3)
                .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: animateRect)
                .onAppear() {
                    animateRect.toggle()
                }
        }.offset(x: motionOffsetX, y: motonOffsetY)
    }
}

struct ShaftView_Previews: PreviewProvider {
    static var previews: some View {
        ShaftView(width: 200)
            .overlay(ShaftMotionView(motionWidth: 180, motionOffsetX: 0, motonOffsetY: -7))
    }
}

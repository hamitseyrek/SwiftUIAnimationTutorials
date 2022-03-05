//
//  ArcView.swift
//  SwiftUIAnimationTutorials
//
//  Created by Hamit Seyrek on 4.03.2022.
//

import SwiftUI

struct Arc1View: View {
    var radius: CGFloat
    @Binding var fillColor: Color
    @Binding var shadowColor: Color
    
    var body: some View {
        Arc1Shape(radius: radius)
            .fill(fillColor)
            .shadow(color: shadowColor, radius: 5)
            .frame(height: radius)
            .animation(Animation.spring().speed(0.75))
            .onTapGesture {
                fillColor = Color.wifiConnected
            }
    }
}

struct Arc1Shape : Shape {
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var p = Path()
        p.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: self.radius, startAngle: .degrees(220), endAngle: .degrees(320), clockwise: false)
        return p.strokedPath(.init(lineWidth: 6, lineCap: .round))
    }
}

struct Arc1View_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            Arc1View(radius: 42, fillColor: .constant(Color.green), shadowColor: .constant(Color.red))
        }
    }
}

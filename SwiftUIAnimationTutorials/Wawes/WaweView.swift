//
//  WaweView.swift
//  SwiftUIAnimationTutorials
//
//  Created by Hamit Seyrek on 2.03.2022.
//

import SwiftUI

struct WaveView: Shape {
    var yOffset: CGFloat = 0.1
    
    var animatableData: CGFloat {
        get {
            return yOffset
        }
        set {
            yOffset = newValue
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        //curve the bottom
        path.addCurve(to: CGPoint(x: rect.minX, y: rect.maxY),
                      control1: CGPoint(x: rect.maxX * 0.75, y: rect.maxY - (rect.maxY * yOffset)),
                       control2: CGPoint(x: rect.maxX * 0.25, y: rect.maxY + (rect.maxY * yOffset)))
        path.closeSubpath()
        return path
    }
}

struct WaveView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
        WaveView(yOffset: 0.7)
            .stroke(Color.red, lineWidth: 3)
            .frame(height: 200)
        .padding()
            .previewDisplayName("Wave")
            
        }
    }
}

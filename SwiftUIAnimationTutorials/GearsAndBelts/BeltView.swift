//
//  BeltView.swift
//  SwiftUIAnimationTutorials
//
//  Created by Hamit Seyrek on 2.03.2022.
//

import SwiftUI

struct BeltView: View {
    
    @State var animateBelt: Bool = false
    var beltWidth: CGFloat = 0.0
    var beltHeight: CGFloat = 0.0
    var offsetBeltX: CGFloat = 0.0
    var offsetBeltY: CGFloat = 0.0
    var dashPhaseValue: CGFloat = 40
    var rotateDegrees: Double = 0.0
    var xAxis: CGFloat = 0.0
    var yAxis: CGFloat = 0.0
    var zAxis: CGFloat = 0.0
    
    var body: some View {
        ZStack {
            //belt
            Capsule()
                .trim(from: 0, to: 1)
                .stroke(Color.black, style: StrokeStyle(lineWidth: 7, lineJoin: .round, dash: [5, 1.5], dashPhase: animateBelt ? dashPhaseValue : 0))
                .frame(width: beltWidth, height: beltHeight)
                .animation(Animation.linear(duration: 3).repeatForever(autoreverses: false).speed(3), value: animateBelt)
                .onAppear {
                    animateBelt.toggle()
                }
        }
        .shadow(color: .black, radius: 1, x: 1, y: 0)
        .rotationEffect(.degrees(rotateDegrees), anchor: .center)
        .offset(x: offsetBeltX, y: offsetBeltY)
    }
}

struct BeltView_Previews: PreviewProvider {
    static var previews: some View {
        BeltView(animateBelt: true, beltWidth: 380, beltHeight: 48, offsetBeltX: 0, offsetBeltY: 0, rotateDegrees: 90)
            .previewLayout(.fixed(width: 100, height: 400))
    }
}

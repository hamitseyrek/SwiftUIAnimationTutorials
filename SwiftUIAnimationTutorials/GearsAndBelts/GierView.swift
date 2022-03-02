//
//  GierView.swift
//  SwiftUIAnimationTutorials
//
//  Created by Hamit Seyrek on 2.03.2022.
//

import SwiftUI

struct GierView: View {
    
    @State private var rotateGear = false
    var gearImage: String = "singleGear"
    var gearWidth: CGFloat = 0.0
    var gearDegrees: Double = 0.0
    var offsetGearX: CGFloat = 0.0
    var offsetGearY: CGFloat = 0.0
    var rotateDegrees: Double = 0.0
    var duration: Double = 0.0
    var xAxis: CGFloat = 0.0
    var yAxis: CGFloat = 0.0
    var zAxis: CGFloat = 0.0
    
    var body: some View {
        ZStack {
            Image(gearImage).resizable().aspectRatio(contentMode: .fit)
                .frame(width: gearWidth)
                .rotationEffect(.degrees(rotateGear ? gearDegrees : 0))
                .animation(.linear(duration: duration).repeatForever(autoreverses: false), value: rotateGear)
                .rotation3DEffect(.degrees(rotateDegrees), axis: (x: xAxis, y: yAxis, z: zAxis))
                .offset(x: offsetGearX, y: offsetGearY)
        }.onAppear {
            rotateGear.toggle()
        }.shadow(color: .black, radius: 1, x: 0, y: 0)
    }
}

struct GierView_Previews: PreviewProvider {
    static var previews: some View {
        GierView(gearImage: "singleGear", gearWidth: 100, gearDegrees: 360, offsetGearX: 0, offsetGearY: 0, rotateDegrees: 0, duration: 5, xAxis: 0.0, yAxis: 0.0, zAxis: 0.0)
    }
}

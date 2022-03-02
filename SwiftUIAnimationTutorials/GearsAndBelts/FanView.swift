//
//  FanView.swift
//  SwiftUIAnimationTutorials
//
//  Created by Hamit Seyrek on 2.03.2022.
//

import SwiftUI

struct FanView: View {
    var degrees: Double = 360 * 4
    @State private var rotateFan = false
    
    var body: some View {
        ZStack {
            Image("fan").resizable().aspectRatio(contentMode: .fit).frame(width: 200)
                .rotationEffect(.degrees(rotateFan ? degrees : 0), anchor: .center)
                .animation(Animation.linear(duration: 4).repeatForever(autoreverses: false), value: rotateFan)
        }.onAppear() {
            rotateFan.toggle()
        }.shadow(color: .black, radius: 1)
    }
}

struct FanView_Previews: PreviewProvider {
    static var previews: some View {
        FanView()
    }
}

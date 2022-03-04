//
//  CircleEmitterView.swift
//  SwiftUIAnimationTutorials
//
//  Created by Hamit Seyrek on 4.03.2022.
//

import SwiftUI

struct CircleEmitterView: View {
    @Binding var isAnimating: Bool
    
    var body: some View {
        Circles()
            .fill(Color.white.opacity(0.75))
            .scaleEffect(isAnimating ? 2 : 0)
            .animation(isAnimating ? Animation.spring() : Animation.easeInOut(duration: 0), value: isAnimating)
    }
}

struct CircleEmitter_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            CircleEmitterView(isAnimating: .constant(true))
        }
        
    }
}

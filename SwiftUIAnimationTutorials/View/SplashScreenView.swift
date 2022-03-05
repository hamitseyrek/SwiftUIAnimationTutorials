//
//  SplashScreenView.swift
//  SwiftUIAnimationTutorials
//
//  Created by Hamit Seyrek on 5.03.2022.
//

import SwiftUI

extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
}

struct SplashScreenView: View {
    @State var animate = false
    @State var endSplash = false
    
    var body: some View {
        ZStack {
            Color.offWhite
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.offWhite)
                .frame(width: 300, height: 300)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)

            VStack {
                Image("codemIcon")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: animate ? .fill : .fit)
                    .frame(width: animate ? nil : 285)
                // Scaling View
                    .scaleEffect(animate ? 3 : 1)
                // setting width to avoid over size
                    .frame(width: UIScreen.main.bounds.width)
                
                
            }
        }
        .ignoresSafeArea(.all, edges: .all)
        .onAppear(perform: animateSplash)
        // hiding view after finished
        .opacity(endSplash ? 0 : 1)
    }
    func animateSplash() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            // You can adjust your own duration
            // or wait until data loads
            withAnimation(Animation.easeOut(duration: 0.55)) {
                animate.toggle()
            }
            
            withAnimation(Animation.linear(duration: 0.45)) {
                endSplash.toggle()
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}

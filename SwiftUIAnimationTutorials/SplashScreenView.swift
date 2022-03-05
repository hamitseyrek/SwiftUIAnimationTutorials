//
//  SplashScreenView.swift
//  SwiftUIAnimationTutorials
//
//  Created by Hamit Seyrek on 5.03.2022.
//

import SwiftUI

struct SplashScreenView: View {
    @State var animate = false
    @State var endSplash = false
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("codemLogo")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: animate ? .fill : .fit)
                    .frame(width: animate ? nil : 185)
                // Scaling View
                    .scaleEffect(animate ? 3 : 1)
                // setting width to avoid over size
                    .frame(width: UIScreen.main.bounds.width)
                
                Text("SwiftUI Tutorials").foregroundColor(.purple)
                
                HStack {
                    Text("Hamit").font(.largeTitle).fontWeight(.bold).foregroundColor(.white)
                    Text(" Seyrek").font(.largeTitle).fontWeight(.bold).foregroundColor(.red)
                }
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

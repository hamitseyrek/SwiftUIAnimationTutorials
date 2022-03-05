//
//  ParallaxEffectView.swift
//  SwiftUIAnimationTutorials
//
//  Created by Hamit Seyrek on 27.02.2022.
//

import SwiftUI

struct ParallaxEffectView: View {
    
    @State private var animate1 = false
    @State private var animate2 = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .gray, .green]), startPoint: .top, endPoint: .bottom)
                .colorInvert()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Text("Parallax Effect")
                    .font(.title)
                    .fontWeight(.bold)
                    .shadow(color: .white, radius: 2.0, x: 2.0, y: 2.0)
                    .padding()
                
                Text("CodemVia")
                    .font(.title)
                    .fontWeight(.semibold)
                
                VStack {
                    Image("codemvia")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .shadow(color: .white, radius: 0.0, x: 3.0, y: 2.0)
                        .shadow(color: .black, radius: 20.0, x: 2.0, y: 2.0)
                }.rotation3DEffect(
                    .degrees(animate1 ? 13 : -13),
                    axis: (x: animate1 ? 90 : -25, y: animate1 ? -45 : -120, z: 1.0)
                )
                    .animation(.easeInOut(duration: 3.5).repeatForever(autoreverses: true), value: animate1)
                    .onAppear() {
                        animate1.toggle()
                    }
                
                
                Text("Hamit Seyrek")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding()
                
                VStack {
                    Image("hamit")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .cornerRadius(25)
                        .shadow(color: .black, radius: 30.0, x: 2.0, y: 2.0)
                }.rotation3DEffect(
                    .degrees(animate2 ? 13 : -13),
                    axis: (x: animate2 ? 90 : -25, y: animate2 ? -45 : -90, z: 0)
                )
                    .animation(.easeInOut(duration: 4.5).repeatForever(autoreverses: true), value: animate2)
                    .onAppear() {
                        animate2.toggle()
                    }.padding()
                
            }
        }
    }
}

struct ParallaxEffectView_Previews: PreviewProvider {
    static var previews: some View {
        ParallaxEffectView()
    }
}

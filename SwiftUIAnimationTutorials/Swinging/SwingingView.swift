//
//  SwingingView.swift
//  SwiftUIAnimationTutorials
//
//  Created by Hamit Seyrek on 28.02.2022.
//

import SwiftUI

struct SwingingView: View {
    
    @State private var girlInSwingAnimate = false
    @State private var leftLegAnimate = false
    @State private var rightLegAnimate = false
    let fadeGradient = Gradient(colors: [.clear, .black])
    
    var body: some View {
        ZStack {
            Image("tree")
                .resizable()
                .frame(width: 900, height: 950)
            
            ZStack {
                //MARK: - Rop e Pieces
                /// left
                Image("rope").resizable().aspectRatio(contentMode: .fit)
                    .mask(LinearGradient(gradient: fadeGradient, startPoint: .top, endPoint: .bottom))
                    .frame(width: 6, height: 100)
                    .offset(x: -3, y: 35)
                
                /// middle left
                Image("rope").resizable().aspectRatio(contentMode: .fit)
                    .frame(width: 6, height: 100)
                    .offset(x: -3, y: 80)
                
                /// right
                Image("rope").resizable().aspectRatio(contentMode: .fit)
                    .mask(LinearGradient(gradient: fadeGradient, startPoint: .top, endPoint: .bottom))
                    .frame(width: 6, height: 100)
                    .offset(x: 24, y: 35)
                
                /// middle right
                Image("rope").resizable().aspectRatio(contentMode: .fit)
                    .frame(width: 6, height: 100)
                    .offset(x: 24, y: 80)
                
                //MARK: - Legs
                /// left
                Image("leftLeg").resizable().aspectRatio(contentMode: .fit)
                    .rotationEffect(.degrees(leftLegAnimate ? 65 : -5), anchor: .leading)
                    .scaleEffect(0.15)
                    .offset(x: 70, y: 175)
                    .animation(.easeInOut(duration: 0.4).delay(1).repeatForever(autoreverses: true), value: leftLegAnimate)
                    .onAppear {
                        leftLegAnimate.toggle()
                    }
                
                /// right
                Image("rightLeg").resizable().aspectRatio(contentMode: .fit)
                    .rotationEffect(.degrees(rightLegAnimate ? 0 : 70), anchor: .leading)
                    .scaleEffect(0.15)
                    .offset(x: 70, y: 175)
                    .animation(.easeInOut(duration: 1).delay(0.09).repeatForever(autoreverses: true), value: rightLegAnimate)
                    .onAppear {
                        rightLegAnimate.toggle()
                    }
                
                //MARK: Girl
                /// right
                Image("swingLady").resizable().aspectRatio(contentMode: .fit)
                    .scaleEffect(0.15)
                    .offset(y: 140)
                
            }.rotationEffect(.degrees(girlInSwingAnimate ? 12 : -5), anchor: .top)
                .animation(.easeInOut(duration: 1).delay(0.09).repeatForever(autoreverses: true), value: girlInSwingAnimate)
                .onAppear {
                    girlInSwingAnimate.toggle()
                }
        }
    }
}

struct SwingingView_Previews: PreviewProvider {
    static var previews: some View {
        SwingingView()
    }
}

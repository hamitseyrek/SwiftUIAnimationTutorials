//
//  OnBoarding.swift
//  SwiftUIAnimationTutorials
//
//  Created by Hamit Seyrek on 5.03.2022.
//

import SwiftUI

struct OnBoarding: View {
    @State var offset: CGFloat = .zero
    
    var body: some View {
        
        OffsetPageTabView(offset: $offset) {
            
            HStack {
                ForEach(boardingScreens) { screen in
                    VStack(spacing: 15) {
                        Image(screen.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: getScreenBounds().width - 100, height: getScreenBounds().width - 100)
                            .offset(y: -150)
                            .zIndex(-1)
                        
                        VStack(alignment: .leading, spacing: 15) {
                            Text(screen.title)
                                .font(.largeTitle.bold())
                                .foregroundColor(.white)
                                .zIndex(-1)
                            
                            Text(screen.description)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .offset(y: -70)
                    }
                    .frame(width: getScreenBounds().width)
                    .frame(maxHeight: .infinity)
                }
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 50)
                .fill(Color.white)
                .frame(width: getScreenBounds().width - 100, height: getScreenBounds().width - 100)
                .scaleEffect(2)
                .rotationEffect(.init(degrees: 25))
                .rotationEffect(.init(degrees: getRotation()))
                .offset(y: -getScreenBounds().width + 20)
                .zIndex(1.0)
        )
        .background(
            Color("screen\(getIndex() + 1)")
                .animation(.easeInOut, value: getIndex())
                .zIndex(1)
            
        )
        .ignoresSafeArea(.container, edges: .all)
        .overlay(
            VStack {
                HStack {
                    HStack(spacing: 8) {
                        ForEach(boardingScreens.indices, id: \.self) { index in
                            Circle()
                                .fill(Color.white)
                                .opacity(index == getIndex() ? 1 : 0.4)
                                .frame(width: 8, height: 8)
                                .scaleEffect(index == getIndex() ? 1.3 : 0.85)
                                .animation(.easeInOut, value: getIndex())
                        }
                    }
                    .frame(maxWidth: .infinity)
                    
                    Button {
                        NotificationCenter.default.post(name: Notification.Name("PassOnBoarding"), object: nil)
                    } label: {
                        Text("Skip")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                }
                .padding(.top, 25)
            }
                .padding()
            ,alignment: .bottom
        )
    }
    
    func getRotation() -> Double {
        let process = offset / (getScreenBounds().width * 4)
        let rotation = Double(process) * 360
        
        return rotation
    }
    
    func getIndex() -> Int {
        let process = offset / getScreenBounds().width
        
        return Int(process)
    }
}

struct OnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding()
    }
}

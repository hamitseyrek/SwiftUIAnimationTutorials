//
//  FlyPresentDismissTransitionView.swift
//  SwiftUIAnimationTutorials
//
//  Created by Hamit Seyrek on 26.02.2022.
//

import SwiftUI

struct FlyPresentDismissTransitionView: View {
    var body: some View {
        OpenSettingsView()
    }
}


struct PresentAndDismiss: GeometryEffect {
    var offsetValue: Double
    var animatableData: Double {
        get { offsetValue }
        set { offsetValue = newValue }
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        let rotationOffset = offsetValue
        let angleOfRotation = CGFloat(Angle(degrees: 95 * (1 - rotationOffset)).radians)
        var transform3D = CATransform3DIdentity
        transform3D.m34 = -1 / max(size.width, size.height)
        
        transform3D = CATransform3DRotate(transform3D, angleOfRotation, 1, 0, 0)
        transform3D = CATransform3DTranslate(transform3D, -size.width/2.0, -size.height/2.0, 0)
        
        let transformAffine1 = ProjectionTransform(CGAffineTransform(translationX: size.width/2.0, y: size.height / 2.0))
        let transformAffine2 = ProjectionTransform(CGAffineTransform(scaleX: CGFloat(offsetValue * 2), y: CGFloat(offsetValue * 2)))
        if offsetValue <= 0.5 {
            return ProjectionTransform(transform3D).concatenating(transformAffine2).concatenating(transformAffine1)
        } else {
            return ProjectionTransform(transform3D).concatenating(transformAffine1)
        }
    }
}

struct OpenSettingsView: View {
    @State private var  isShowing = false
    let gradientBackground = Gradient(colors: [.black, .white, .black])
    let buttonBorderGradient = LinearGradient(gradient: Gradient(colors: [.black, .white, .black]), startPoint: .bottomLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        VStack {
            ZStack {
                LinearGradient(gradient: gradientBackground, startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.vertical)
                
                VStack {
                    Text("Wake Up").foregroundColor(.black).font(.title)
                    Image(systemName: "clock").font(.largeTitle)
                }.offset(y: -25)
                
                Button(action: {
                    withAnimation(.easeInOut(duration: 1.0)) {
                        self.isShowing = true
                    }
                }) {
                    Image(systemName: "gear") .font(Font.system(size: 20).weight(.bold))
                }
                .padding(10)
                .background(Color.orange)
                .cornerRadius(30)
                .foregroundColor(.black)
                .padding(8)
                .overlay(RoundedRectangle(cornerRadius: 30)
                            .stroke(buttonBorderGradient, lineWidth: 5)
                            .shadow(color: .gray, radius: 5))
                .offset(y: 200)
                
                if isShowing {
                    SettingsView(show: $isShowing)
                        .transition(.fly)
                        .zIndex(1)
                }
            }
        }
    }
}

extension AnyTransition {
    static var fly: AnyTransition {
        get {
            AnyTransition.modifier(active: PresentAndDismiss(offsetValue: 0), identity: PresentAndDismiss(offsetValue: 1))
        }
    }
}

struct FlyPresentDismissTransitionView_Previews: PreviewProvider {
    static var previews: some View {
        FlyPresentDismissTransitionView()
    }
}

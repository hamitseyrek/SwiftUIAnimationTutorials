//
//  RecordPlayerView.swift
//  SwiftUIAnimationTutorials
//
//  Created by Hamit Seyrek on 24.02.2022.
//

import SwiftUI

struct RecordPlayerView: View {
    
    @State private var rotateRecord = false
    @State private var rotateArm = false
    @State private var shouldAnimate = false
    @State private var degrees = 0.0
    
    var body: some View {
        ZStack{
            RadialGradient(gradient: Gradient(colors: [Color.white, Color.black]), center: .center, startRadius: 20, endRadius: 600)
                .scaleEffect(1.2)
            
            //MARK: - RECORD PLAYER BOX
            RecordPlayerBox()
                .offset(y: -100)
            
            //MARK: - RECORD
            VStack{
                RecordView(degrees: $degrees, shouldAnimate: $shouldAnimate)
                    //.offset(y: -75)
                
                //MARK: - ARM
                ArmView(rotateArm: $rotateArm)
                
                //MARK: - BUTTON
                Button(action: {
                        shouldAnimate.toggle()
                    if shouldAnimate{
                        degrees = 36000
                        rotateArm.toggle()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.9) {
                            playSound(sound: "sevemedim", type: "m4a")
                        }
                    } else {
                        rotateArm.toggle()
                        degrees = 0
                        audioPlayer?.stop()
                    }
                }) {
                    HStack(spacing: 8){
                        if !shouldAnimate{
                            Text("Play")
                            Image(systemName: "play.circle.fill")
                                .imageScale(.large)
                        } else{
                            Text("Stop")
                            Image(systemName: "stop.fill")
                                .imageScale(.large)
                        }
                    }
                    
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(Capsule().strokeBorder(Color.black, lineWidth: 1.25))
                }
            }
        }
    }
}

struct RecordPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        RecordPlayerView()
    }
}

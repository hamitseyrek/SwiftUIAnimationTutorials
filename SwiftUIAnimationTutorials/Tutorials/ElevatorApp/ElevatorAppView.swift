//
//  ElevatorAppView.swift
//  SwiftUIAnimationTutorials
//
//  Created by Hamit Seyrek on 27.02.2022.
//

import SwiftUI

struct ElevatorAppView: View {
    
    //@State private var
    
    var body: some View {
        Elevator()
    }
}

struct Elevator : View {
    
    @State private var doorsOpened = false
    @State private var floor1 = false
    @State private var floor2 = false
    @State private var animateSmiley = false
    @State private var floorCountDirection = false
    
    @State var doorOpenTimer: Timer? = nil
    @State var chimeSoundTimer: Timer? = nil
    @State var doorsOpenCloseSoundTimer: Timer? = nil
    
    let backgroundColor = Color(UIColor.black)
    
    var body: some View {
        ZStack {
            backgroundColor.edgesIgnoringSafeArea(.all)
            
            Image("smiley").resizable().aspectRatio(contentMode: .fit)
                .scaleEffect(animateSmiley ? 1 : 0.01, anchor: .bottom)
                .animation(Animation.spring(response: 0.4, dampingFraction: 0.4).delay(2.5), value: animateSmiley)
            
            FrameAndDoorsView(doorsOpened: $doorsOpened)
            
            GeometryReader { geo in
                
                //MARK: - Button
                Button ( action: {
                    stopTimer()
                    playDoorOpenCloseSound(interval: 0.5)
                    animateSmiley.toggle()
                    doorsOpened.toggle()
                    floorCountDirection.toggle()
                    floorNumbersLight()
                }) {
                    HStack {
                        if !doorsOpened {
                            Circle().frame(width: 10, height: 10)
                                .foregroundColor(.white)
                                .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.red, lineWidth: 1))
                        } else {
                            Circle().frame(width: 10, height: 10)
                                .foregroundColor(.black)
                                .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.red, lineWidth: 1))
                        }
                    }.padding(5)
                        .background(Color.black)
                        .cornerRadius(30)
                        .padding(8)
                }.position(x: (geo.size.width / 33), y: (geo.size.height / 2))
                
                //MARK: - Floor Numbers
                HStack {
                    Image(systemName: "1.circle").foregroundColor(.black)
                        .opacity(floor1 ? 1 : 0.3)
                    Image(systemName: "2.circle").foregroundColor(.black)
                        .opacity(floor2 ? 1 : 0.3)
                }.position(x: (geo.size.width / 2), y: (geo.size.height * 0.02) + 2)
                    .font(.system(size: 25))
            }
        }
    }
    
    func openDoors() {
        doorOpenTimer = Timer.scheduledTimer(withTimeInterval: 8, repeats: false, block: { _ in
            doorsOpened.toggle()
        })
    }
    
    func playChimeSound() {
        chimeSoundTimer = Timer.scheduledTimer(withTimeInterval: 5.5, repeats: false, block: { _ in
            myPlaySound(mySound: "elevatorChime", type: "m4a")
        })
    }
    
    func playDoorOpenCloseSound(interval: TimeInterval) {
        doorsOpenCloseSoundTimer = Timer.scheduledTimer(withTimeInterval: interval, repeats: false, block: { _ in
            myPlaySound(mySound: "doorsOpenClose", type: "m4a")
        })
    }
    
    func stopTimer() {
        doorOpenTimer?.invalidate()
        doorOpenTimer = nil
        chimeSoundTimer?.invalidate()
        chimeSoundTimer = nil
        doorsOpenCloseSoundTimer?.invalidate()
        doorsOpenCloseSoundTimer = nil
    }
    
    func floorNumbersLight() {
        if !floor2 {
            floor1.toggle()
        }
        
        if !doorsOpened {
            animateSmiley.toggle()
            openDoors()
            playChimeSound()
            
            if floorCountDirection {
                withAnimation(Animation.default.delay(4.0)) {
                    floor2 = true
                    floor1 = false
                }
                
                withAnimation(Animation.default.delay(5.0)) {
                    floor1 = true
                    floor2 = false
                    playDoorOpenCloseSound(interval: 8.5)
                }
            } else if !floorCountDirection {
                withAnimation(Animation.default.delay(5.0)) {
                    floor1 = true
                    floor2 = false
                    playDoorOpenCloseSound(interval: 8.5)
                }
                
                withAnimation(Animation.default.delay(5.0)) {
                    floor2 = true
                    floor1 = false
                }
            }
        }
    }
}

struct ElevatorAppView_Previews: PreviewProvider {
    static var previews: some View {
        ElevatorAppView()
    }
}

//
//  PlaySound.swift
//  SwiftUIAnimationTutorials
//
//  Created by Hamit Seyrek on 27.02.2022.
//

import Foundation
import AVFoundation

var myAudioPlayer : AVAudioPlayer?

func myPlaySound(mySound: String, type: String) {
    if let path = Bundle.main.path(forResource: mySound, ofType: type) {
        do {
            myAudioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            myAudioPlayer?.play()
        } catch {
            print("Error: Could not find any play the sound file!")
        }
    }
}

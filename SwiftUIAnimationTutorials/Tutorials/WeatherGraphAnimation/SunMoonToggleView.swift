//
//  SunMoonToggleView.swift
//  SwiftUIAnimationTutorials
//
//  Created by Hamit Seyrek on 2.03.2022.
//

import SwiftUI
import SunMoonToggleStyle

struct SunMoonToggleView: View {
    
    @Binding var isOn: Bool
    
    var body: some View {
        
        HStack {
            Toggle(isOn: $isOn, label: label)
                .toggleStyle(SunMoonToggleStyle())
                .padding(.horizontal, 114)
        }
    }
    
    func label() -> Text {
        isOn ? Text("Moon").bold() : Text("Sun").bold()
    }
}

struct SunMoonToggleView_Previews: PreviewProvider {
    static var previews: some View {
        SunMoonToggleView(isOn: .constant(true)).previewLayout(.fixed(width: 200, height: 200))
    }
}

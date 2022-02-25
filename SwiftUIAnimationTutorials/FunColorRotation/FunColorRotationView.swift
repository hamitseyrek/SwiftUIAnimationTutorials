//
//  FunColorRotationView.swift
//  SwiftUIAnimationTutorials
//
//  Created by Hamit Seyrek on 25.02.2022.
//

import SwiftUI

struct FunColorRotationView: View {
    
    @State private var shiftColors = false
    @State private var image = "dog"
    let backgrounColor = Color(.black)
    
    var body: some View {
        VStack{
            ZStack{
                backgrounColor
                //.edgesIgnoringSafeArea(.all)
                    .scaleEffect(1.4)
                
                Image(image)
                    .resizable()
                    .padding(20)
                    .frame(width: 350, height: 350)
                    .hueRotation(.degrees(self.shiftColors ? 360 * 2 : 0))
                    .animation(Animation.easeInOut(duration: 2).delay(0.4).repeatForever(autoreverses: true))
                    .onAppear{
                        self.shiftColors.toggle()
                    }
            }
            ImagePicker(selectedImage: $image)
                .frame(width: 350, height: 200)
        }.background(Color.black)
            .edgesIgnoringSafeArea(.bottom)
    }
    
}
struct ImagePicker: View{
    @Binding var selectedImage: String
    let images: [String] = ["ornament", "landscape", "dog", "dice", "cat"]
    
    var body: some View{
        Picker(selection: $selectedImage, label: Text("Fraction")) {
            
            ForEach(images, id: \.self){ value in
                Text(value)
                    .foregroundColor(.white)
                    .font(.title)
            }
        }
        .frame(width: 300, height: 160)
        .pickerStyle(WheelPickerStyle())
        .compositingGroup()
        .clipped()
        
    }
}

struct FunColorRotationView_Previews: PreviewProvider {
    static var previews: some View {
        FunColorRotationView()
    }
}

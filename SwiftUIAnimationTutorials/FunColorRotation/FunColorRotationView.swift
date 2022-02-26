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
                    .animation(Animation.easeInOut(duration: 2).delay(0.4).repeatForever(autoreverses: true), value: self.shiftColors)
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
        .pickerStyle(WheelPickerStyle())
        .frame(width: 300, height: 150)
        .background(Color.black.colorMultiply(.gray))
        .cornerRadius(20)
        .shadow(color: .gray, radius: 0.2, x: 0, y: 0)
    }
}

struct FunColorRotationView_Previews: PreviewProvider {
    static var previews: some View {
        FunColorRotationView()
    }
}

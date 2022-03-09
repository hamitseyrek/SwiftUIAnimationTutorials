//
//  GridDetailView.swift
//  SwiftUIAnimationTutorials
//
//  Created by Hamit Seyrek on 7.03.2022.
//

import SwiftUI

struct GridDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var animationView: AnyView
    @State var show = false
    // to load Hero View After Animation is done
    @State var loadView = true
    
    var body: some View {
        VStack {
                ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
                    animationView
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 100)
                    if loadView {
                        HStack {
                            Button(action: {
                                loadView.toggle()
                                
                                withAnimation(.spring()) {
                                    show.toggle()
                                    self.presentationMode.wrappedValue.dismiss()
                                }
                            }) {
                                Image(systemName: "xmark")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.black.opacity(0.5))
                                    .clipShape(Circle())
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                
                            }) {
                                Image(systemName: "suit.heart.fill")
                                    .foregroundColor(.red)
                                    .padding()
                                    .background(Color.white)
                                    .clipShape(Circle())
                            }
                        }
                        .padding(.top, 35)
                        .padding(.horizontal)
                    }
                }.background(Color.blue)
        }.background(Color.black)
    }
}



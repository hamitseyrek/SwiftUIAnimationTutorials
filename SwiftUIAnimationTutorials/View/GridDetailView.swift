//
//  GridDetailView.swift
//  SwiftUIAnimationTutorials
//
//  Created by Hamit Seyrek on 7.03.2022.
//

import SwiftUI

struct GridDetailView: View {
    @State var selected: TutorialModel = tutorials[0]
    @State var show = false
    // to load Hero View After Animation is done
    @State var loadView = true
    
    init(tut: String) {
        print(tut)
    }
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
                    HeartAnimateView()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 100)
                    
                    if loadView {
                        HStack {
                            Button(action: {
                                loadView.toggle()
                                
                                withAnimation(.spring()) {
                                    show.toggle()
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
                
                // Detail View
                // loading after animation
                if loadView {
                    VStack {
                        HStack {
                            Text(selected.keys)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            
                        }
                        //.padding(.top)
                        .padding(.horizontal)
                        
                        Text("Australia is the oldest, flattest, and driest inhabited continent, with the least fertile soils. It has a landmass of 7,617,930 square kilometres (2,941,300 sq mi). A megadiverse country, its size gives it a wide variety of landscapes, with deserts in the centre, tropical rainforests in the north-east, and mountain ranges in the south-east. Australia generates its income from various sources, including mining-related exports, telecommunications, banking, manufacturing, and international education.")
                            .multilineTextAlignment(.leading)
                            .padding(.top)
                            .padding(.horizontal)
                    }
                }
            }
        }
        .background(Color.white)
    }
}



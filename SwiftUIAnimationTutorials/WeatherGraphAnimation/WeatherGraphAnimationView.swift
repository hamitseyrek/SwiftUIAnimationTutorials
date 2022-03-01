//
//  WeatherGraphAnimationView.swift
//  SwiftUIAnimationTutorials
//
//  Created by Hamit Seyrek on 1.03.2022.
//

import SwiftUI

struct WeatherGraphAnimationView: View {
    
    @State var dataArray = [DataModel.temperature, DataModel.precipitation, DataModel.wind]
    
    var capsuleWidth: CGFloat = 14
    @State private var pickerSelection = 0
    @State private var isOn = false
    @State private var animateTemp = false
    @State private var animateTempImage = false
    @State private var animatePrecip = false
    @State private var animatePrecipImage = false
    @State private var animateWind = false
    @State private var animateWindImage = false
    
    init() {
            //the forground color of each selected segment
            UISegmentedControl.appearance().selectedSegmentTintColor = .black
            //the color of the title for the selected segment
            UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
            //the color of the title for the unselected segment
            UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
        }
    
    var body: some View {
        ZStack {
            Color(.sRGB, red: 255/255, green: 195/255, blue: 0/255, opacity: 1).edgesIgnoringSafeArea(.all)
            VStack {
                Text("Weather App").font(.title2).font(.system(size: 40)).fontWeight(.medium)
                    .shadow(color: .black, radius: 1, x: 0, y: 1)
                
                PickerView(pickerSelection: $pickerSelection)
                
                
                ZStack {
                    HStack(spacing: 20) {
                        WeeklyGraph(dayHeightData: dataArray[pickerSelection][0], width: 350 / capsuleWidth)
                        WeeklyGraph(dayHeightData: dataArray[pickerSelection][1], width: 350 / capsuleWidth)
                        WeeklyGraph(dayHeightData: dataArray[pickerSelection][2], width: 350 / capsuleWidth)
                        WeeklyGraph(dayHeightData: dataArray[pickerSelection][3], width: 350 / capsuleWidth)
                        WeeklyGraph(dayHeightData: dataArray[pickerSelection][4], width: 350 / capsuleWidth)
                        WeeklyGraph(dayHeightData: dataArray[pickerSelection][5], width: 350 / capsuleWidth)
                        WeeklyGraph(dayHeightData: dataArray[pickerSelection][6], width: 350 / capsuleWidth)
                    }
                    .animation(.spring(response: 0.9, dampingFraction: 0.6))
                    
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: 1).shadow(color: Color.black, radius: 8, x: 3, y: 3)
                        .padding(.horizontal,10)
                }
                
                GeometryReader { geo in
                    VStack {
                        if animateTemp {
                            Text("Temperature").fontWeight(.medium).font(.title).shadow(color: .black, radius: 1, x: 0, y: 2).transition(AnyTransition.offset(x: 300)).animation(Animation.easeOut(duration: 1.0), value: animateTemp)
                        }
                        
                        if animatePrecip {
                            Text("Precipitation").fontWeight(.medium).font(.title).shadow(color: .black, radius: 1, x: 0, y: 2).transition(AnyTransition.offset(x: -300)).animation(Animation.easeOut(duration: 1.0), value: animatePrecip)
                        }
                        
                        if animateWind {
                            Text("Wind").fontWeight(.medium).font(.title).shadow(color: .black, radius: 1, x: 0, y: 2).transition(AnyTransition.offset(x: 300)).animation(Animation.easeOut(duration: 1.0), value: animateWind)
                        }
                    }.position(x: geo.size.width * 0.5, y: geo.size.height * 0.2)
                    
                    VStack {
                        if animateTempImage {
                            Image("tempImage").resizable().aspectRatio(contentMode: .fit)
                                .frame(width: geo.size.width / 2, height: geo.size.height / 2)
                                .position(y: geo.size.height / 2).transition(AnyTransition.offset(y: 300))
                                .animation(Animation.easeOut(duration: 1.0), value: animateTempImage)
                        }
                        
                        if animatePrecipImage {
                            Image("precip").resizable().aspectRatio(contentMode: .fit)
                                .frame(width: geo.size.width / 2, height: geo.size.height / 2)
                                .position(y: geo.size.height / 2).transition(AnyTransition.offset(x: 300))
                                .animation(Animation.easeOut(duration: 1.0), value: animatePrecipImage)
                        }
                        
                        if animateWindImage {
                            Image("wind").resizable().aspectRatio(contentMode: .fit)
                                .frame(width: geo.size.width / 2, height: geo.size.height / 2)
                                .position(y: geo.size.height / 2).transition(AnyTransition.offset(x: -300))
                                .animation(Animation.easeOut(duration: 1.0), value: animateWindImage)
                        }
                    }.position(x: geo.size.width, y: geo.size.height * 0.6)
                }
            }
        }
    }
}



struct WeeklyGraph: View {
    var dayHeightData: DataModel
    var width: CGFloat
    
    var body: some View {
        VStack {
            ZStack (alignment: .bottom) {
                Capsule().opacity(0.3)
                    .frame(width: width + 2, height: 200)
                    .background(RoundedRectangle(cornerRadius: 14).stroke(Color.black, lineWidth: 1))
                    .shadow(color: Color.black, radius: 9, x: -6, y: 0)
                Capsule()
                    .frame(width: width, height: dayHeightData.data * 200)
                    .overlay(RoundedRectangle(cornerRadius: 20).fill(Color.white).opacity(0.9))
            }.padding(.bottom, 8)
            Text(dayHeightData.day)
                .font(.system(size: 14))
        }
    }
}

struct WeatherGraphAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherGraphAnimationView()
    }
}

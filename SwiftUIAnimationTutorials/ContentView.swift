//
//  ContentView.swift
//  SwiftUIAnimationTutorials
//
//  Created by Hamit Seyrek on 24.02.2022.
//

import SwiftUI

struct ContentView: View {
    @State var goToHome = false
    @State var filteredItems = tutorials
    var gridModel = CustomGridViewModel()
    
    var body: some View {
        ZStack {
            if goToHome {
                CustomNavigationView(view: AnyView(HomeView(filteredItems: $filteredItems)), placeHolder: "Apps, Animations", largeTitle: true, title: "SwiftUI Apps", onSearch: { txt in
                            
                            // filtering Data
                            if txt != "" {
                                self.filteredItems = tutorials.filter{
                                    $0.keys.lowercased().contains(txt.lowercased())
                                }
                            } else {
                                self.filteredItems = tutorials
                            }
                        }, onCancel: {
                            // Do you own code when search and canceled
                            self.filteredItems = tutorials
                        })
                        .ignoresSafeArea()
                        .environmentObject(gridModel)
            } else {
                OnBoarding()
            }
            SplashScreenView()
        }
        .onReceive(NotificationCenter.default.publisher(for: Notification.Name("PassOnBoarding")), perform: { _ in
            withAnimation {
                goToHome = true
            }
        })
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    
    func getScreenBounds() -> CGRect {
        return UIScreen.main.bounds
    }
    
}

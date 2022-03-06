//
//  ContentView.swift
//  SwiftUIAnimationTutorials
//
//  Created by Hamit Seyrek on 24.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var goToHome = false
    @StateObject var homeModel = CarouselViewModel()
    
    var body: some View {
        ZStack {
            if goToHome {
                HomeView().environmentObject(homeModel)
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

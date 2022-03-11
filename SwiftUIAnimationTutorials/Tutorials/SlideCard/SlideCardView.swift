//
//  SlideCardView.swift
//  SwiftUIAnimationTutorials
//
//  Created by Hamit Seyrek on 11.03.2022.
//

import SwiftUI

struct SlideCardView: View {
    @StateObject var carouselViewModel = CarouselViewModel()
    
    var body: some View {
        CustomCarouselView().environmentObject(carouselViewModel)
    }
}

struct SlideCardView_Previews: PreviewProvider {
    static var previews: some View {
        SlideCardView()
    }
}

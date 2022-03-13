//
//  CarouselViewModel.swift
//  SwiftUIAnimationTutorials
//
//  Created by Hamit Seyrek on 6.03.2022.
//

import SwiftUI

class CarouselViewModel: ObservableObject {
    
    @Published var cards = [
        CardModel(cardColor: Color("purple"), title: "SwiftUI Apps"),
        CardModel(cardColor: Color("blue"), title: "Codemvia Community"),
        CardModel(cardColor: Color("green"), title: "Hamit Seyrek"),
        CardModel(cardColor: Color.orange, title: "SwiftUI Apps"),
        CardModel(cardColor: Color.yellow, title: "Codemvia Community"),
    ]
    
    @Published var swipedCard = 0
    
    // Detail Content
    @Published var showCard = false
    @Published var selectedCard = CardModel(cardColor: .clear, title: "")
    
    @Published var showContent = false
    
    var content = "'SwiftUI Apps' application that made with SwiftUI, which includes many sample applications, was made by Hamit Seyrek, the founder of the CodemVia community that on a voluntary basis. SwiftUI App has been developed using O'Reilly Media, Kavsoft and many other internet resources."
}

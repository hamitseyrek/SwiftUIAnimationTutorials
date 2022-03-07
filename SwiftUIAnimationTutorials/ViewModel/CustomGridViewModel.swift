//
//  CustomGridViewModel.swift
//  SwiftUIAnimationTutorials
//
//  Created by Hamit Seyrek on 6.03.2022.
//

import SwiftUI

class CustomGridViewModel: ObservableObject {
    @Published var items = tutorials

@Published var swipedCard = 0

// Detail Content
@Published var showCard = false
@Published var selectedCard = TutorialModel(name: "hamitt", slug: "slugım", keys: "mykeys", image: "hamit")

@Published var showContent = false

}

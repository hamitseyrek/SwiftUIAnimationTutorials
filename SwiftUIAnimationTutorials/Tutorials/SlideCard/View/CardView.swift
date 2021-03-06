//
//  CardView.swift
//  SwiftUIAnimationTutorials
//
//  Created by Hamit Seyrek on 6.03.2022.
//

import SwiftUI

struct CardView: View {
    @EnvironmentObject var model: CarouselViewModel
    var card: CardModel
    var animation: Namespace.ID
    
    var body: some View {
        VStack {
            HStack {
                Text(card.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: 200, alignment: .leading)
                    .padding(.leading, 20)
                    .matchedGeometryEffect(id: "Title-\(card.id)", in: animation)
                
                Spacer(minLength: 0)
            }
            
            Text("Monday 28 December")
                .font(.caption)
                .foregroundColor(Color.white.opacity(0.85))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.top, 10)
                .matchedGeometryEffect(id: "Date-\(card.id)", in: animation)
            
            HStack {
                Spacer(minLength: 0)
                
                Image(systemName: "arrow.right")
            }
            .foregroundColor(Color.white.opacity(0.9))
            .padding(30)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            card.cardColor
                .cornerRadius(25)
                .matchedGeometryEffect(id: "bgColor-\(card.id)", in: animation)
        )
        .onTapGesture {
            print("tıklandı")
            withAnimation(.spring()) {
                
                model.selectedCard = card
                model.showCard.toggle()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    withAnimation(.easeIn) {
                        model.showContent = true
                    }
                }
            }
        }
    }
}

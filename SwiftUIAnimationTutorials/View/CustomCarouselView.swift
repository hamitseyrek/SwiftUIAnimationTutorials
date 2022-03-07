//
//  CustomCarouselView.swift
//  SwiftUIAnimationTutorials
//
//  Created by Hamit Seyrek on 6.03.2022.
//

import SwiftUI

struct CustomCarouselView: View {
    @EnvironmentObject var model: CarouselViewModel
    @Namespace var animation
    
    var body: some View {
        ZStack {
            Button(action: ResetViews) {
                Image(systemName: "arrow.right")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.blue)
                    .padding()
                    .background(Color.white)
                    .clipShape(Circle())
                    .shadow(radius: 3)
            }
            
            ForEach(model.cards.indices.reversed(), id: \.self) { index in
                HStack {
                    CardView(card: model.cards[index], animation: animation)
                        .scaleEffect(getScale(index: index))
                        .offset(x: getCardOffset(index: index))
                        .rotationEffect(Angle(degrees: getCardRotation(index: index)))
                    
                    Spacer(minLength: 0)
                }
                .frame(height: 240)
                .contentShape(Rectangle())
                .offset(x: model.cards[index].offset)
                .gesture(DragGesture(minimumDistance: 0)
                            .onChanged({ (value) in
                    onChanged(value: value, index: index)
                }).onEnded({ (value) in
                    onEnd(value: value, index: index)
                }))
            }
            if model.showCard {
                CarouselDetailView(animation: animation)
            }
        }
        .padding(.horizontal, 20)
    }
    
    // Resetting Views
    func ResetViews() {
        for index in model.cards.indices {
            withAnimation(.spring()) {
                model.cards[index].offset = 0
                model.swipedCard = 0
            }
        }
    }
    
    func onChanged(value: DragGesture.Value, index: Int) {
        // Only Left Swipe
        if value.translation.width < 0 {
            model.cards[index].offset = value.translation.width
        }
    }
    
    func onEnd(value: DragGesture.Value, index: Int) {
        withAnimation {
            if -value.translation.width > UIScreen.main.bounds.width / 3 {
                model.cards[index].offset = -UIScreen.main.bounds.width
                model.swipedCard += 1
            } else {
                model.cards[index].offset = 0
            }
        }
    }
    
    // Getting Rotation when Card is being Swiped
    func getCardRotation(index: Int) -> Double {
        
        let boxWidth = Double(UIScreen.main.bounds.width / 3)
        
        let offset = Double(model.cards[index].offset)
        
        let angle: Double = 5
        
        return (offset / boxWidth) * angle
    }
    
    func getScale(index: Int) -> CGFloat {
        switch index - model.swipedCard {
        case 0:
            return 1.0
        case 1:
            return 0.9
        case 2:
            return 0.8
        default:
            return 0.6
        }
    }
    
    // Getting OFfset
    func getCardOffset(index: Int) -> CGFloat {
        return index - model.swipedCard <= 2 ? CGFloat(index - model.swipedCard) * 30 : 60
    }
}

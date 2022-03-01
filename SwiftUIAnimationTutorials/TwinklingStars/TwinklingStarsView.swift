//
//  TwinklingStarsView.swift
//  SwiftUIAnimationTutorials
//
//  Created by Hamit Seyrek on 1.03.2022.
//

import SwiftUI

struct TwinklingStarsView: View {
    
    @State private var animateYellow = false
    @State private var animateBlue = false
    @State private var animateRed = false
    @State private var animatePurple = false
    @State private var animateGreen = false
    @State private var starThickness : CGFloat = 0.0
    var starPoints = 0
    
    var body: some View {
        ZStack {
            Image("stars").resizable().aspectRatio(contentMode: .fill).edgesIgnoringSafeArea(.all)
            
            VStack {
                //change the amount of points to create a sun effect
                CreateStar(starPoints: 4, starThickness: $starThickness, animateStar: $animateYellow, fillColor: .yellow, starSizeStart: 0.021, starSizeEnd: 0.08, shadowColor: .yellow)
                    .offset(y: 10)
                    .onAppear() {
                        withAnimation (Animation.easeOut(duration: 2.3).repeatForever(autoreverses: true)){
                            animateYellow.toggle()
                            starThickness = 0.35
                        }
                    }
                
                CreateStar(starPoints: 6, starThickness: $starThickness, animateStar: $animateBlue, fillColor: .blue, starSizeStart: 0.01, starSizeEnd: 0.063, shadowColor: .white)
                    .offset(x: 70, y: -60)
                    .onAppear() {
                        withAnimation (Animation.easeOut(duration: 3.3).repeatForever(autoreverses: true)){
                            animateBlue.toggle()
                            starThickness = 0.35
                        }
                    }
                
                CreateStar(starPoints: 5, starThickness: $starThickness, animateStar: $animateRed, fillColor: .red, starSizeStart: 0.02, starSizeEnd: 0.074, shadowColor: .red)
                    .offset(x: -70, y: -150)
                    .onAppear() {
                        withAnimation (Animation.easeOut(duration: 3.3).repeatForever(autoreverses: true)){
                            animateRed.toggle()
                            starThickness = 0.35
                        }
                    }
                
                CreateStar(starPoints: 6, starThickness: $starThickness, animateStar: $animatePurple, fillColor: .purple, starSizeStart: 0.02, starSizeEnd: 0.04, shadowColor: .purple)
                    .offset(x: 80, y: -120)
                    .onAppear() {
                        withAnimation (Animation.easeOut(duration: 3.3).repeatForever(autoreverses: true)){
                            animatePurple.toggle()
                            starThickness = 0.35
                        }
                    }
                
                CreateStar(starPoints: 6, starThickness: $starThickness, animateStar: $animateGreen, fillColor: .green, starSizeStart: 0.02, starSizeEnd: 0.094, shadowColor: .green)
                    .offset(x: -80, y: -170)
                    .onAppear() {
                        withAnimation (Animation.easeOut(duration: 3.3).repeatForever(autoreverses: true)){
                            animateGreen.toggle()
                            starThickness = 0.35
                        }
                    }
            }
        }
    }
}

struct Star : Shape {
    let starPoints : Int
    var starThickness : CGFloat
    var animateTableData : CGFloat {
        get { starThickness }
        set { starThickness = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        ///make sure the star has at least 3 points
        guard starPoints >= 3 else { return Path() }
        
        //make the value negative and they move across the sky
        ///create an x and y point to start the drawing from
        let drawPoint = CGPoint(x: rect.width / 1.2, y: rect.height / 0.5)
        
        ///make the angle of the star straight up (change this value to change the stars angle)
        var starAngle = -CGFloat.pi / 2
        
        ///adjust the stars angle based on how many points are chosen
        let adjustedStarAngle = .pi * 2 / CGFloat(starPoints * 2)
        
        ///adjust the inner x and y points of the star based on the stars thickness
        let pointX = drawPoint.x * starThickness
        let pointY = drawPoint.y * starThickness
        
        ///create a path instance to start the drawing
        var path = Path()
        
        ///start the path off at the initial position we set drawPoint to be...we'll use a little math here to move the path along on the x and y points
        path.move(to: CGPoint(x: drawPoint.x * cos(starAngle), y: drawPoint.y * sin(starAngle)))
        
        ///keep track of the lowest point so we can center it
        var bottomEdge: CGFloat = 0
        
        ///loop over all the points and figure out the location of this point with some math
        for corner in 0..<starPoints * 2 {
            let sinAngle = sin(starAngle)
            let cosAngle = cos(starAngle)
            let bottom: CGFloat
            
            //change the value to 8 to create a raindrop if you want
            ///check to see if we are a multiple of two, if so, then we are drawing the outer edge of the star
            if corner.isMultiple(of: 2) {
                ///store this position in bottom
                bottom = drawPoint.y * sinAngle
                
                ///add a line to there
                path.addLine(to: CGPoint(x: drawPoint.x * cosAngle, y: bottom))
            } else {
                ///in the else, we're not a multiple of 2, so we are drawing an inner point
                ///store this y position in bottom
                bottom = pointY * sinAngle
                
                ///add a line to there
                path.addLine(to: CGPoint(x: pointX * cosAngle, y: bottom))
            }
            ///check the bottom var, if this new bottom point is our lowest, store it in bottomEdge for later
            if bottom > bottomEdge {
                bottomEdge = bottom
            }
            ///move on to the next corner
            starAngle += adjustedStarAngle
        }
        
        ///calculate how much unused space we have at the bottom of our drawing rectangle
        let bottomSpace = (rect.height / 2 - bottomEdge) / 2
        
        ///create and add a transform that oves the path down by that amount, centering the shape vertically
        let transform = CGAffineTransform(translationX: drawPoint.x, y: drawPoint.y + bottomSpace)
        return path.applying(transform)
    }
}

struct CreateStar: View {
    var starPoints: Int
    @Binding var starThickness: CGFloat
    @Binding var animateStar: Bool
    
    var fillColor: Color
    var starSizeStart: CGFloat
    var starSizeEnd: CGFloat
    var shadowColor: Color
    
    var body: some View {
        VStack {
            Star(starPoints: starPoints, starThickness: starThickness)
                .fill(fillColor)
                .frame(width: 80, height: 80)
                .scaleEffect(animateStar ? starSizeStart : starSizeEnd)
                .shadow(color: shadowColor, radius: 20, x: 3, y: 3)
        }
    }
}


struct TwinklingStarsView_Previews: PreviewProvider {
    static var previews: some View {
        TwinklingStarsView()
    }
}

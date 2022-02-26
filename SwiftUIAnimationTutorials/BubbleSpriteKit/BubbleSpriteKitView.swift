//
//  BubbleSpriteKitView.swift
//  SwiftUIAnimationTutorials
//
//  Created by Hamit Seyrek on 26.02.2022.
//

import SwiftUI
import SpriteKit

class GameScene: SKScene {
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let ball = SKSpriteNode(imageNamed: "dodgeBall")
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width / 2.7)
        ball.physicsBody?.restitution = 0.4
        ball.position = location
        addChild(ball)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let ball = SKSpriteNode(imageNamed: "dodgeBall")
        //ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width / 9.7)
        ball.physicsBody?.restitution = 0.4
        ball.position = location
        addChild(ball)
    }
}

struct BubbleSpriteKitView: View {
    var scene :  SKScene {
        let scene = GameScene()
        scene.size = CGSize(width: UIScreen.main.bounds.size.width * 25, height: UIScreen.main.bounds.size.height * 25)
        return scene
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.black, .white.opacity(0.8), .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                SpriteView(scene: scene)
                    .frame(width: UIScreen.main.bounds.size.width - 40, height: UIScreen.main.bounds.size.height - 100)
            }
        }
    }
}

struct BubbleSpriteKitView_Previews: PreviewProvider {
    static var previews: some View {
        BubbleSpriteKitView()
    }
}

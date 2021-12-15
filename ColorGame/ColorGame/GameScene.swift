//
//  GameScene.swift
//  ColorGame
//
//  Created by Kas Song on 12/15/21.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var tracksArray: [SKSpriteNode]? = [SKSpriteNode]()
    var player: SKSpriteNode?
    
    override func didMove(to view: SKView) {
        setupTracks()
        createPlayer()
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.previousLocation(in: self)
            let node = nodes(at: location).first
            
            if node?.name == "right" {
                print("Right")
            } else if node?.name == "up" {
                print("Up")
            } else if node?.name == "down" {
                print("Down")
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    func createPlayer() {
        player = SKSpriteNode(imageNamed: "player")
        guard let playerPosition = tracksArray?.first?.position.x else { return }
        player?.position = CGPoint(x: playerPosition, y: size.height / 2)
        addChild(player!)
    }
    
    func setupTracks() {
        for i in 0...8 {
            if let track = childNode(withName: "\(i)") as? SKSpriteNode {
                tracksArray?.append(track)
            }
        }
    }
}

//
//  GameObject.swift
//  MAPD724-Assignment1
//
//  Created by Akash sharma on 2022-01-21.
//

import SpriteKit
import GameplayKit

class GameObject : SKSpriteNode {
    // common GameObject variables
    var width: CGFloat?
    var height: CGFloat?
    var halfWidth: CGFloat?
    var halfHeight: CGFloat?
    var scale: CGFloat?
    
    
    // Initializers
    init(imageString: String, initialScale: CGFloat) {
        // initialize the GameObject with an image
        let texture = SKTexture(imageNamed: imageString)
        let color = UIColor.clear
        
        super.init(texture: texture, color: color, size: texture.size())
        setScale(initialScale)
        self.scale = initialScale
        
        self.width = texture.size().width * self.scale!
        self.height = texture.size().height * self.scale!
      
        self.halfWidth = self.width! * 0.5
        self.halfHeight = self.height! * 0.5
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // class Functions (methods)
    func Reset() {
        
    }
    
    func CheckBounds() {
        
    }
    
    func Start() {
        
    }
    
    func Update() {
        
    }
}


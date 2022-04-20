//
//  Background.swift
//  MAPD724-Assignment1
//
//  Created by Akash sharma on 2022-01-21.
//

import SpriteKit
import GameplayKit

class Background : GameObject {
    
    init() {
        super.init(imageString: "background", initialScale: 1.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

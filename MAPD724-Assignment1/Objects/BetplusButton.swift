//
//  BetplusButton.swift
//  MAPD724-Assignment1
//
//  Created by Akash sharma on 2022-01-21.
//

import SpriteKit
import GameplayKit

class BetplusButton : GameObject {
    
    init() {
        super.init(imageString: "plus", initialScale: 0.15)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

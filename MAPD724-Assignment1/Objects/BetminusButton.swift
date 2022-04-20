//
//  BetminusButton.swift
//  MAPD724-Assignment1
//
//  Created by Akash sharma on 2022-01-21.
//

import SpriteKit
import GameplayKit

class BetminusButton : GameObject {
    
    init() {
        super.init(imageString: "minus", initialScale: 0.075)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

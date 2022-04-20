//
//  QuitButton.swift
//  MAPD724-Assignment1
//
//  Created by Akash sharma on 2022-01-21.
//

import SpriteKit
import GameplayKit

class QuitButton : GameObject {
    
    init() {
        super.init(imageString: "quit", initialScale: 3.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  HelpButton.swift
//  MAPD724-Assignment1
//
//  Created by Inderjit Singh on 2022-04-10.
//

import SpriteKit
import GameplayKit

class HelpButton : GameObject {
    
    init() {
        super.init(imageString: "help", initialScale: 0.15)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

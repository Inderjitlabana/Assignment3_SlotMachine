//
//  GameScene.swift
//  MAPD724-Assignment1
//
//  Created by Akash sharma on 2022-01-21.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    //initializers
     var background: Background?
     var spinbutton: SpinButton?
     var quitbutton: QuitButton?
     var resetbutton: ResetButton?
     var betplusbutton: BetplusButton?
     var betminusbutton: BetminusButton?
     var helpbutton: HelpButton?
    
     var firstImage = SKSpriteNode()
     var secondImage = SKSpriteNode()
     var thirdImage = SKSpriteNode()
    
     var availableCreditLabel: SKLabelNode!
     var currentBetLabel: SKLabelNode!
     var winningAmountLabel: SKLabelNode!
     var labelWinning: SKLabelNode!
    
    
     var initialCredit: Int = 20
     var currentBet: Int = 0
     var winningAmount:Int = 0
     var remainingCredit: Int = 0
    
     var textures = [SKTexture]()
    
    
    override func didMove(to view: SKView) {
        
        // adding background
        background = Background()
        background?.position = CGPoint(x: 10, y: -80)
        background?.size = self.frame.size
        addChild(background!)
        
        // adding a spin button
        spinbutton = SpinButton()
        spinbutton?.name = "spin"
        spinbutton?.position = CGPoint(x: 5, y: -570)
        spinbutton?.zPosition = 1
        addChild(spinbutton!)
        
        // adding a quit button
        quitbutton = QuitButton()
        quitbutton?.name = "quit"
        quitbutton?.position = CGPoint(x: -200, y: -530)
        quitbutton?.zPosition = 1
        addChild(quitbutton!)
        
        // adding a reset button
        resetbutton = ResetButton()
        resetbutton?.name = "reset"
        resetbutton?.position = CGPoint(x: 200, y: -530)
        resetbutton?.zPosition = 1
        addChild(resetbutton!)
        
        // adding a bet-plus button
        betplusbutton = BetplusButton()
        betplusbutton?.name = "increase"
        betplusbutton?.position = CGPoint(x: -100, y: -500)
        betplusbutton?.zPosition = 1
        addChild(betplusbutton!)
        
        // adding a bet-minus button
        betminusbutton = BetminusButton()
        betminusbutton?.name = "decrease"
        betminusbutton?.position = CGPoint(x: 100, y: -500)
        betminusbutton?.zPosition = 1
        addChild(betminusbutton!)
        
        
        // adding an available credit label
        availableCreditLabel = SKLabelNode(fontNamed: "Verdana")
        availableCreditLabel.text = String(initialCredit)
        availableCreditLabel.color = .white
        availableCreditLabel.position = CGPoint(x: -170, y: -390)
        availableCreditLabel.zPosition = 1
        addChild(availableCreditLabel)
        
        // adding an current bet label
        currentBetLabel = SKLabelNode(fontNamed: "Verdana")
        currentBetLabel.text = String(currentBet)
        currentBetLabel.color = .white
        currentBetLabel.position = CGPoint(x: 20, y: -390)
        currentBetLabel.zPosition = 1
        addChild(currentBetLabel)
        
        // adding a winning amount label
        winningAmountLabel = SKLabelNode(fontNamed: "Verdana")
        winningAmountLabel.text = String(winningAmount)
        winningAmountLabel.color = .white
        winningAmountLabel.position = CGPoint(x: 220, y: -390)
        winningAmountLabel.zPosition = 1
        addChild(winningAmountLabel)
        
        // adding a winning message label
        labelWinning = SKLabelNode(fontNamed: "Verdana")
        labelWinning.color = .white
        labelWinning.position = CGPoint(x: 5, y: 400)
        labelWinning.zPosition = 1
        labelWinning.text = "2000"
        addChild(labelWinning)


        // binding spritekit nodes to objects
        firstImage = (self.childNode(withName: "image1") as? SKSpriteNode)!
        secondImage = (self.childNode(withName: "image2") as? SKSpriteNode)!
        thirdImage = (self.childNode(withName: "image3") as? SKSpriteNode)!
        

        // appending images to textures array
        textures.append(SKTexture(imageNamed: "Kiwi"))
        textures.append(SKTexture(imageNamed: "Lemon"))
        textures.append(SKTexture(imageNamed: "Mango"))
        textures.append(SKTexture(imageNamed: "Grape"))

        }
        
        
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedNode = atPoint(location)
            if touchedNode.name == "spin" {
                labelWinning.text = "2000"
                
                if currentBet == 0
                {
                    let alert = UIAlertController(title: "Can't place $0 bet", message: "Please choose amount to bet.", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Got it!", style: UIAlertAction.Style.default, handler: nil))
                    self.view?.window?.rootViewController?.present(alert, animated: true, completion: nil)
                }
                else
                {
                    let rand = Int(arc4random_uniform(UInt32(textures.count)))
                    let rand2 = Int(arc4random_uniform(UInt32(textures.count)))
                    let rand3 = Int(arc4random_uniform(UInt32(textures.count)))
                    
                    let texture = textures[rand] as SKTexture
                    let texture2 = textures[rand2] as SKTexture
                    let texture3 = textures[rand3] as SKTexture
                    
                    firstImage.texture = texture
                    secondImage.texture = texture2
                    thirdImage.texture = texture3
                    
                    if (texture == texture2 && texture2 == texture3)
                    {
                        labelWinning.text = "You Win!"
                        
                        winningAmount = (currentBet * 2)
                        winningAmountLabel.text = String(winningAmount)
                      
                        self.updateRemainingCredit(winningAmount: winningAmount)
                    }
                    else
                    {
                        labelWinning.text = "Try again!"
                        labelWinning.text = "2000"
                        
                        winningAmount = 0
                        self.winningAmountLabel.text = String(winningAmount)
                        
                        // update remaining credit after every lose
                        self.updateRemainingCredit(winningAmount: winningAmount)
                    }
                }
            }
            else if touchedNode.name == "increase"{
               
                
                winningAmountLabel.text = ""
                labelWinning.text = ""
                
                currentBet = currentBet + 1
                
                let c = self.updateCredit(currentBet: currentBet)
                
                currentBetLabel.text = String(currentBet)
                availableCreditLabel.text = String(c)
                
                //To prevent user to place bet when user has no credit
                if c <= 0
                {
                    let alert = UIAlertController(title: "Out of credit!", message: "You don't have enough credit to bet!", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Got it!", style: UIAlertAction.Style.default, handler: nil))
                    self.view?.window?.rootViewController?.present(alert, animated: true, completion: nil)
                    
                   // isUserInteractionEnabled = false
                }
                
            }
            else if touchedNode.name == "decrease"{
                
                if currentBet == 0
                {
                    print("Error")
                }
                else
                {
                    currentBet = currentBet - 1
                    remainingCredit = (remainingCredit + 1)
                    
                    currentBetLabel.text = String(currentBet)
                    availableCreditLabel.text = String(remainingCredit)
                }
            }
            else if touchedNode.name == "quit"{
                quitGame()
            }
            else if touchedNode.name == "reset"{
                
                initialCredit = 10
                currentBet = 0
                availableCreditLabel.text = String(initialCredit)
                currentBetLabel.text = String(currentBet)
            }
            
            
        }
    }
    
    //updating available credit after every bet
    func updateCredit(currentBet: Int) -> Int
    {
        labelWinning.text = "2000"
        remainingCredit = (initialCredit - currentBet)
        return remainingCredit
    }
    
    //function to update available credit after every spin
    func updateRemainingCredit(winningAmount:Int)
    {
        labelWinning.text = "2000"
        currentBet = 0
        remainingCredit += winningAmount
        initialCredit = remainingCredit
        availableCreditLabel.text = String(remainingCredit)
        currentBetLabel.text = String(currentBet)
    }
    
    func quitGame()
    {
        exit(0)
    }
    override func update(_ currentTime: TimeInterval) {
    }
}

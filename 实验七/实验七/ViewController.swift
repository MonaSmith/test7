//
//  ViewController.swift
//  实验七
//
//  Created by apple on 2018/11/24.
//  Copyright © 2018年 wanfengling. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var game = Concentration(numberOfPairsOfCards:(cardButtons.count+1)/2)
    
    var flipCount = 0{
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender){
            //flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else{
            print("chose card was not in carButtons")
        }
        //print("cardNumber = \(cardNumber)")
        //flipCard(withEmoji: "👻", on: sender)
    }
    
//    @IBAction func touchSecondCard(_ sender: UIButton) {
//        flipCount += 1
//        flipCard(withEmoji: "🎃", on: sender)
//    }
    
    func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for:card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else{
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched  ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
            }
        }
    }
    
//    func flipCard(withEmoji emoji:String,on button:UIButton){
//        print("flipCard(withEmoji: \(emoji)")
//        if button.currentTitle == emoji{
//
//        }else{
//
//        }
//    }
    
    
    
    
    //    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    
    //var emojiChoices = ["🎃","👻","🎃","👻"]
    
    var emojiChoices = ["🦇","😱","🙀","😈","🎃","👻","🍭","🍬","🍎"]
    
    var emoji = [Int:String]()

    func emoji(for card:Card) -> String{
//        if  emoji[card.identifier] != nil{
//            return emoji[card.identifier]!
//        }else{
//            return "?"
//        }
        if emoji[card.identifier] == nil,emojiChoices.count > 0 {
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
                emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
        
    }

    @IBAction func newGame(_ sender: UIButton) {
        game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
        updateViewFromModel()
    }
}


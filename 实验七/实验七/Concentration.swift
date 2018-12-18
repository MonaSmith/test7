//
//  Concentration.swift
//  实验七
//
//  Created by apple on 2018/11/24.
//  Copyright © 2018年 wanfengling. All rights reserved.
//

import Foundation
class  Concentration {
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
//        if cards[index].isFaceUp{
//            cards[index].isFaceUp = false
//        }else{
//            cards[index].isFaceUp = true
//        }
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }else{
                //either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
            //let matchingCard = card
            cards += [card,card]
//            cards.append(card)
//            cards.append(card)
        }
        //TODO:Shuffle the  cards
        cards.sort { _,_ in arc4random_uniform(2) > 0 }

    }
}

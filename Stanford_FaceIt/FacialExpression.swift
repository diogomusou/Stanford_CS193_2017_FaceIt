//
//  FacialExpression.swift
//  Stanford_FaceIt
//
//  Created by Diogo M Souza on 2017/07/01.
//  Copyright © 2017 Diogo M Souza. All rights reserved.
//

import Foundation

struct FacialExpression {
    enum Eyes : Int {
        case open
        case closed
        case squinting
    }
    
    enum Mouth : Int {
        case smile
        case grin
        case neutral
        case smirk
        case frown
        
        var sadder : Mouth {
            return Mouth(rawValue: rawValue + 1) ?? .frown
        }
        
        var happier : Mouth {
            return Mouth(rawValue: rawValue - 1) ?? .smile
        }
    }
    
    var sadder : FacialExpression {
        return FacialExpression(eyes: self.eyes, mouth: self.mouth.sadder)
    }
    
    var happier : FacialExpression {
        return FacialExpression(eyes: self.eyes, mouth: self.mouth.happier)
    }
    
    let eyes : Eyes
    let mouth : Mouth
    
    
}

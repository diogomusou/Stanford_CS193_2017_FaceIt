//
//  ViewController.swift
//  Stanford_FaceIt
//
//  Created by Diogo M Souza on 2017/06/23.
//  Copyright © 2017 Diogo M Souza. All rights reserved.
//

import UIKit

class FaceViewController: UIViewController {

    @IBOutlet weak var faceView: FaceView! {
        didSet {
            let pinch = UIPinchGestureRecognizer(target: faceView, action: #selector(FaceView.setScale(byReactingTo:)))
            faceView.addGestureRecognizer(pinch)
            let tap = UITapGestureRecognizer(target: self, action: #selector(changeEyes(byReactingTo:)))
            faceView.addGestureRecognizer(tap)
            let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(decreaseHappiness))
            upSwipe.direction = .up
            faceView.addGestureRecognizer(upSwipe)
            let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(increaseHappiness))
            downSwipe.direction = .down
            faceView.addGestureRecognizer(downSwipe)
            updateUI()
        }
    }
    
    @objc func changeEyes(byReactingTo tapRecognizer : UITapGestureRecognizer) {
        if tapRecognizer.state == .ended {
            let eyes : FacialExpression.Eyes = (facialExpression.eyes == .closed) ? .open : .closed
            facialExpression = FacialExpression(eyes: eyes, mouth: facialExpression.mouth)
        }
    }
    
    //swipe have no state (they are discrete)
    @objc func increaseHappiness() {
        facialExpression = facialExpression.happier
    }
    
    @objc func decreaseHappiness() {
        facialExpression = facialExpression.sadder
    }
    
    var facialExpression : FacialExpression = FacialExpression(eyes: .closed, mouth: .frown) {
        didSet {
            updateUI()
        }
    }
    
    private func updateUI (){
        switch facialExpression.eyes {
        case .open:
            faceView?.eyesOpen = true
        case .closed, .squinting:
            faceView?.eyesOpen = false
        }
        
        faceView?.mouthCurvature = mouthCurvature[facialExpression.mouth] ?? 0.0
    }
    
    private let mouthCurvature = [
        FacialExpression.Mouth.smile   : 1.0,
        FacialExpression.Mouth.grin    : 0.5,
        FacialExpression.Mouth.neutral : 0.0,
        FacialExpression.Mouth.smirk   : -0.5,
        FacialExpression.Mouth.frown   : -1.0
    ]


}


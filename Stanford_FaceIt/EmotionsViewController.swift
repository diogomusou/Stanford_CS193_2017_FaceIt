//
//  EmotionsViewController.swift
//  Stanford_FaceIt
//
//  Created by Diogo M Souza on 2017/07/01.
//  Copyright © 2017 Diogo M Souza. All rights reserved.
//

import UIKit

class EmotionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       var destinationViewController = segue.destination
        if let navigationController = destinationViewController as? UINavigationController {
            destinationViewController = (navigationController.visibleViewController) ?? destinationViewController
        }
        if let faceViewController = (destinationViewController as? FaceViewController),
           let identifier = segue.identifier,
           let expression = emotionalFaces[identifier]{
            faceViewController.facialExpression = expression
            faceViewController.navigationItem.title = (sender as? UIButton)?.currentTitle
        }
    }
    
    private let emotionalFaces : Dictionary<String,FacialExpression> = [
        "happy"   : FacialExpression(eyes: .open, mouth: .smile),
        "sad"     : FacialExpression(eyes: .closed, mouth: .frown),
        "worried" : FacialExpression(eyes: .open, mouth: .smirk)
    ]
    

}

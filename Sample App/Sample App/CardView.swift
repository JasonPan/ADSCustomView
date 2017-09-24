//
//  CardView.swift
//  Sample App
//
//  Created by Jason Pan on 24/09/2017.
//  Copyright © 2017 ANT Development Studios. All rights reserved.
//

import UIKit
import ADSCustomView

@IBDesignable
class CardView: ADSCustomView {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func initialize() {
        super.initialize()
        
        self.layer.cornerRadius = 30.0
        self.layer.masksToBounds = true
    }

}

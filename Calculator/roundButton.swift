//
//  roundButton.swift
//  Calculator
//
//  Created by sunny h on 2021/09/07.
//

import UIKit

@IBDesignable
class roundButton: UIButton {
    
    @IBInspectable var isRound: Bool = false{
        didSet{
            if isRound{
                self.layer.cornerRadius = self.frame.height / 2
                
            }
        }
    }
    

}

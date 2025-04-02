//
//  StarWarsRandomizerButton.swift
//  test_app
//
//  Created by Julian Silvestri on 2025-04-01.
//

import UIKit

class StarWarsRandomizerButton: UIButton{
    
    var bgColor = ColorScheme().primaryBackgroundColor
    var foreGroundColor = ColorScheme().primaryForeGroundColor
    var radius = 8
    var setText = "Randomize"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupButton()
    }
    
    func setupButton(){
        self.backgroundColor = bgColor
        self.layer.cornerRadius = 8
        self.setTitleColor(foreGroundColor, for:.normal)
        self.setTitle(setText, for: .normal)
    }
}

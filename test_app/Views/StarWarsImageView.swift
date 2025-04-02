//
//  StarWarsImageView.swift
//  test_app
//
//  Created by Julian Silvestri on 2025-04-01.
//

import UIKit

class StarWarsImageView:UIImageView {
   
    let radius = 8.0
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupImage(){
        self.layer.cornerRadius = radius 
    }
}

//
//  CardsDataModel.swift
//  VezdekodMobileSlider
//
//  Created by  Даниил on 09.04.2022.
//

import UIKit
struct CardsDataModel {
    
    var text : String
    var image : UIImage?
    var adress: String
    var time: String
      
    init(bgColor: UIColor, text: String, image: UIImage?, adress: String, time: String) {
        self.text = text
        self.image = image
        self.adress = adress
        self.time = time
    
    }
}

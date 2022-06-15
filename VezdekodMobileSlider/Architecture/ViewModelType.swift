//
//  ViewModelType.swift
//  VezdekodMobileSlider
//
//  Created by  Даниил on 08.06.2022.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}

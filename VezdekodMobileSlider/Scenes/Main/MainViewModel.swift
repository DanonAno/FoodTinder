//
//  MainViewModel.swift
//  VezdekodMobileSlider
//
//  Created by  Даниил on 07.06.2022.
//

import Foundation
import RxSwift
import RxCocoa

class MainViewModel: ViewModelType {
    struct Input {
        let trigger: Driver<String>
    }
    struct Output {
        let trigger: Driver<CardView.Model>
        
    }
    func transform(input: Input) -> Output {
        let triggerRest = input.trigger.map { (String) -> CardView.Model in
            let names = ["McDonalds","Badar","Burger King", ""]
            let adreses = [""]
            let image = names[0]
            let time = ""
            return CardView.Model.init(image: UIImage(named: image)!, titleLabel: names[0], subtitleLable: adreses[0], timeLabel: time)
        }
        
        return Output(
            trigger: triggerRest)
    }
    
}

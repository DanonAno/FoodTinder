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
        let trigger: Driver<Void>
        let cancelTrigger: Driver<Void>
        let acceptTrigger: Driver<Void>
    }
    struct Output {
        let trigger: Driver<CardView.Model>
        let cancel: Driver<Void>
        let accept: Driver<Void>
    }
    
    
    var zero = 0
    func transform(input: Input) -> Output {
        let cancelAction = input.cancelTrigger.do(onNext: { _ in
            self.zero += 1
            if self.zero > 3 {
                self.zero = 0
            }
        })
        let triggerRest = Driver.merge(cancelAction, input.trigger).map { [self] (_) -> CardView.Model in

            return CardView.Model.init(image: UIImage(named: restourantsModel.init().names[zero])!, titleLabel: restourantsModel.init().names[zero], subtitleLable: restourantsModel.init().adreses[zero], timeLabel: restourantsModel.init().time)
        }
        let acceptAction = input.acceptTrigger.map { (_) in
            
        }
        return Output(
            trigger: triggerRest,
            cancel: cancelAction,
            accept: acceptAction)
    }
}

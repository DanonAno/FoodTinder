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
    
    let names = ["MacDonalds","Hinkaly","BrutLe", "Ozz"]
    let adreses = ["Университетская набережная 1","Энтузиастов 2","Энергетиков 11","Мамина 25Б"]
    let time = "в 5 минутах хотьбы"
    var zero = 0
    func transform(input: Input) -> Output {
        let cancelAction = input.cancelTrigger.do(onNext: { _ in
            self.zero += 1
            if self.zero > 3 {
                self.zero = 0
            }
        })
        let triggerRest = Driver.merge(cancelAction, input.trigger).map { [self] (_) -> CardView.Model in

            return CardView.Model.init(image: UIImage(named: names[zero])!, titleLabel: names[zero], subtitleLable: self.adreses[zero], timeLabel: time)
        }
        let acceptAction = input.acceptTrigger.map { (_) in
            
        }
        return Output(
            trigger: triggerRest,
            cancel: cancelAction,
            accept: acceptAction)
    }
}

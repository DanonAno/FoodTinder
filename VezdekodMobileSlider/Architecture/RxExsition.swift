//
//  RxExsition.swift
//  VezdekodMobileSlider
//
//  Created by  Даниил on 15.06.2022.
//

import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base: UIViewController {
    var viewWillAppear: ControlEvent<Void> {
        return ControlEvent<Void>(events: base.rx.sentMessage(#selector(UIViewController.viewWillAppear(_:))).mapToVoid())
    }

    var viewDidLayoutSubviews: ControlEvent<Void> {
        return ControlEvent<Void>(events: base.rx.sentMessage(#selector(UIViewController.viewDidLayoutSubviews)).mapToVoid())
    }
}

extension ObservableType {
  func asDriverOnErrorJustComplete() -> Driver<Element> {
    return asDriver { _ in
      return Driver.empty()
    }
  }

  func mapToVoid() -> Observable<Void> {
    return map { _ in }
  }
}

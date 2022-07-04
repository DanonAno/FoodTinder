//
//  ViewController.swift
//  VezdekodMobileSlider
//
//  Created by  Даниил on 09.04.2022.
//

import UIKit
import RxSwift
import SnapKit

class MainViewController: UIViewController {
    //MARK: - Subviews
    
    let cardView: CardView = {
       let view = CardView()
       return view
    }()
    let buttonAccept: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Принять", for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 5
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    let buttonCancel: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Отклонить", for: .normal)
        button.backgroundColor = .systemRed
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        return button
    }()
    var viewModel = MainViewModel()
    private let disposeBag = DisposeBag()
    //MARK: - LifeSycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 185/255, green: 185/255, blue: 185/255, alpha: 1)
        setupUI()
        makeSubviewsLayout()
        setupBindings()
    }
    //MARK: - SetupLayout
    private func setupUI() {
        view.addSubview(cardView)
        view.addSubview(buttonAccept)
        view.addSubview(buttonCancel)
    }
    
    private func makeSubviewsLayout() {
        cardView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(110)
            make.left.right.equalToSuperview().inset(24)
            make.bottom.equalToSuperview().inset(120)
        }
        buttonAccept.snp.makeConstraints { make in
            make.top.equalTo(cardView.snp.bottom).offset(36)
            make.left.equalToSuperview().inset(24)
            make.height.equalTo(60)
        }
        buttonCancel.snp.makeConstraints { make in
            make.top.equalTo(cardView.snp.bottom).offset(36)
            make.right.equalToSuperview().inset(24)
            make.height.equalTo(60)
        }
    }
    private func setupBindings() {
         let viewModel = viewModel
        let trigger = rx.sentMessage(#selector(UIViewController.viewWillAppear(_:)))
            .mapToVoid()
            .asDriverOnErrorJustComplete()
        let input = MainViewModel.Input.init(trigger: trigger, cancelTrigger: buttonCancel.rx.tap.asDriver(), acceptTrigger: buttonAccept.rx.tap.asDriver())
        
        let output = viewModel.transform(input: input)
        [
            output.trigger.drive(cardView.rx.model),
            output.accept.drive(self.rx.model)
            
        ]
            .forEach({$0.disposed(by: disposeBag)})
    }
    
}

extension Reactive where Base: MainViewController {
    var model: Binder<Void> {
    return Binder(self.base) { view, model in
        let dialogMessage = UIAlertController(title: "Attention", message: "Ваш заказ принят в обработку", preferredStyle: .alert)
        dialogMessage.addAction(UIAlertAction(title: "OK", style: .cancel))
        view.present(dialogMessage, animated: true)
    }
  }
}

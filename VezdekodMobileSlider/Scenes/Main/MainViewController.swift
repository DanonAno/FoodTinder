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
    
    let cardView = CardView()

    let buttonAccept: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Принять", for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 5
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Отклонить", for: .normal)
        button.backgroundColor = .systemRed
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        return button
    }()
    var viewModel: MainViewModel!
    private let disposeBag = DisposeBag()
    //MARK: - LifeSycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 185/255, green: 185/255, blue: 185/255, alpha: 1)
        setupUI()
        makeUILayout()
    }
    //MARK: - SetupLayout
    private func setupUI() {
        
    }
    
    private func makeUILayout() {
        
    }
    private func setupBindings() {
        
        guard let viewModel = self.viewModel else {
            return
        }
        let trigger = rx.sentMessage(#selector(UIViewController.viewWillAppear(_:)))
        let input = MainViewModel.Input.init(trigger: trigger) //Cannot convert value of type 'Observable<[Any]>' to expected argument type 'Driver<String>' (aka 'SharedSequence<DriverSharingStrategy, String>')
    }
    
    
//    @objc private func acceptZakaz() {
//        let dialogMessage = UIAlertController(title: "Attention", message: "Ваш заказ принят в обработку.", preferredStyle: .alert)
//        self.present(dialogMessage, animated: true, completion: nil)
//
//    }
}


//
//  ViewController.swift
//  VezdekodMobileSlider
//
//  Created by  Даниил on 09.04.2022.
//

import UIKit
import RxSwift
import SnapKit

//For addAction method
@available(iOS 14.0, *)
class MainViewController: UIViewController {
    //MARK: - Subviews
    
    let cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 24
        return view
    }()
    let buttonAccept: UIButton = {
        let button = UIButton()
        button.setTitle("Приянть", for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 5
       //button.addAction(<#T##action: UIAction##UIAction#>, for: <#T##UIControl.Event#>)
        return button
    }()
    let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Отклонить", for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 5
        //button.addAction(<#T##action: UIAction##UIAction#>, for: <#T##UIControl.Event#>)
        return button
    }()
    let nameLabel: UILabel = {
       let label = UILabel()
        label.text = "Dodo pizza"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .green
        return label
    }()
    let adressLabel: UILabel = {
        let label = UILabel()
         label.text = "Ломоносова 17"
         label.font = UIFont.systemFont(ofSize: 15)
         label.textColor = .green
         return label
    }()
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "17:35"
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    let restorauntImage: UIImage = {
        let image = UIImage(named: "MacDonalds")
        
        return image!
    }()
    //MARK: - LifeSycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 185/255, green: 185/255, blue: 185/255, alpha: 1)
        setupUI()
    }
    //MARK: - SetupLayout
    private func setupUI() {
        view.addSubview(cardView)
        view.addSubview(buttonAccept)
        view.addSubview(cancelButton)
        cardView.addSubview(nameLabel)
        cardView.addSubview(timeLabel)
    }
    
    private func makeUILayout() {
        cardView.snp.makeConstraints { make in
            make.top.equalTo(<#T##other: ConstraintRelatableTarget##ConstraintRelatableTarget#>)
        }
    }
}


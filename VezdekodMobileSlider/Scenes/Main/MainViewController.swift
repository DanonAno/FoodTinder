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
        view.layer.cornerRadius = 0
        
        return view
    }()
    let buttonAccept: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Принять", for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 5
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(acceptZakaz), for: .touchUpInside)
        return button
    }()
    let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Отклонить", for: .normal)
        button.backgroundColor = .systemRed
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(setupElements), for: .touchUpInside)
        return button
    }()
    let nameLabel: UILabel = {
       let label = UILabel()
        label.text = "Dodo pizza"
        label.font = UIFont.italicSystemFont(ofSize: 25)
        label.textColor = .black
        return label
    }()
    let adressLabel: UILabel = {
        let label = UILabel()
         label.text = "Ломоносова 17"
         label.font = UIFont.systemFont(ofSize: 15)
         label.textColor = .black
         return label
    }()
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "17:35"
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    let restorauntImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "DodoPizza")
//        image.layer.cornerRadius = 24
        image.layer.masksToBounds = false
        //image.image.
        return image
    }()
    
    var namesModel = ["Badar", "BrutLe", "DodoPizza","Hinkaly", "MacDonalds", "Ozz"]
    //MARK: - LifeSycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 185/255, green: 185/255, blue: 185/255, alpha: 1)
        setupUI()
        makeUILayout()
    }
    //MARK: - SetupLayout
    private func setupUI() {
        view.addSubview(cardView)
        view.addSubview(buttonAccept)
        view.addSubview(cancelButton)
        cardView.addSubview(nameLabel)
        cardView.addSubview(adressLabel)
        cardView.addSubview(timeLabel)
        cardView.addSubview(restorauntImage)
    }
    
    private func makeUILayout() {
        cardView.snp.makeConstraints { make in
            make.center.equalTo(view.snp.center)
            make.left.right.equalToSuperview().inset(30)
            make.height.equalTo(400)
        }
        nameLabel.snp.makeConstraints { make in
            make.bottom.equalTo(cardView.snp.bottom).inset(50)
            make.left.equalTo(cardView.snp.left).inset(12)
        }
        adressLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(4)
            make.left.equalTo(cardView.snp.left).inset(12)
        }
        timeLabel.snp.makeConstraints { make in
            make.top.equalTo(adressLabel.snp.bottom).offset(4)
            make.left.equalTo(cardView.snp.left).inset(12)
        }
        restorauntImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.bottom.equalTo(nameLabel).inset(50)
        }
        
        buttonAccept.snp.makeConstraints { make in
            make.top.equalTo(cardView.snp.bottom).offset(10)
            make.left.equalToSuperview().inset(50)
            make.height.equalTo(50)
            make.width.equalTo(cancelButton.snp.width)
        }
        cancelButton.snp.makeConstraints { make in
            make.top.equalTo(cardView.snp.bottom).offset(10)
            make.left.equalTo(buttonAccept.snp.right).offset(50)
            make.height.equalTo(50)
        }
        
    }
    
    @objc private func setupElements() {
        let randomLogic = namesModel.randomElement()
        switch randomLogic {
        case "Badar":
            nameLabel.text = "Badar"
            adressLabel.text = "Проспект победы 12"
            restorauntImage.image = UIImage(named: randomLogic!)
        case "BrutLe":
            nameLabel.text = "Брют ли"
            adressLabel.text = "Университетская набережная 12"
            restorauntImage.image = UIImage(named: randomLogic!)
        case "DodoPizza":
            nameLabel.text = "Dodo Pizza"
            adressLabel.text = "Ломоносова 17"
            restorauntImage.image = UIImage(named: randomLogic!)
        case "Hinkaly":
            nameLabel.text = "Хинкали и Вино"
            adressLabel.text = "Где то рядом с Юургу"
            restorauntImage.image = UIImage(named: randomLogic!)
        case "MacDonalds":
            nameLabel.text = "Мак дональдс"
            adressLabel.text = "Кирова 21"
            restorauntImage.image = UIImage(named: randomLogic!)
        case "Ozz":
            nameLabel.text = "Ozz"
            adressLabel.text = "Энтузиастов 11"
            restorauntImage.image = UIImage(named: randomLogic!)
        default:
            break
            
        }
        reloadInputViews()
    }
    @objc private func acceptZakaz() {
        var dialogMessage = UIAlertController(title: "Attention", message: "Ваш заказ принят в обработку.", preferredStyle: .alert)
        self.present(dialogMessage, animated: true, completion: nil)
        
    }
}


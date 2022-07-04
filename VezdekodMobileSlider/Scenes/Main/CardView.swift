//
//  CardView.swift
//  VezdekodMobileSlider
//
//  Created by  Даниил on 15.06.2022.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class CardView: UIView {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "", size: 20)
        return label
    }()
    private let adressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "", size: 13)
        return label
    }()
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "", size: 15)
        return label
    }()
    private let restorauntImage: UIImageView = {
       let image  = UIImageView(image: UIImage())
        image.clipsToBounds = true
       return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 16
        layer.borderWidth = 2
        backgroundColor = .white
        setupUI()
        makeSubviewsLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(nameLabel)
        addSubview(adressLabel)
        addSubview(timeLabel)
        addSubview(restorauntImage)
    }
    private func makeSubviewsLayout() {
        restorauntImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().inset(140)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(restorauntImage.snp.bottom).offset(10)
            make.left.equalToSuperview().inset(16)
        }
        adressLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(14)
            make.left.equalToSuperview().inset(16)
        }
        timeLabel.snp.makeConstraints { make in
            make.top.equalTo(adressLabel.snp.bottom).offset(14)
            make.left.equalToSuperview().inset(16)
        }
    }
    struct Model {
        let image: UIImage
        let titleLabel: String
        let subtitleLable: String
        let timeLabel: String
        func setup(view: CardView){
            view.restorauntImage.image = image
            view.nameLabel.text = titleLabel
            view.adressLabel.text = subtitleLable
            view.timeLabel.text = timeLabel
        }
    }
}
extension Reactive where Base: CardView {
    var model: Binder<CardView.Model> {
    return Binder(self.base) { view, model in
        model.setup(view: view)
    }
  }
}

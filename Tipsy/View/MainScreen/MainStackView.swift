//
//  MainStackView.swift
//  Tipsy
//
//  Created by Лилия Феодотова on 13.02.2023.
//

import UIKit

class MainStackView: UIStackView {

    let label: UILabel = {
        let label = UILabel()
        label.text = "Total Bill"
        label.font = .boldSystemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "money")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter the invoice amount and click \"Calculate\""
        label.font = .boldSystemFont(ofSize: 15)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        label.numberOfLines = 2
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let totalBillView: TotalBillView = {
        let view = TotalBillView(frame: .zero)
        return view
    }()
    
    let personCountView: PersonCountView = {
        let view = PersonCountView(frame: .zero)
        return view
    }()
    
    let tipsView: TipsView = {
        let view = TipsView(frame: .zero)
        return view
    }()
    
    lazy var calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Calculate", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.tintColor = .white
        button.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var result = "0"
    var tipsCount = 0
    
    
    @objc func calculateButtonTapped(){
        guard let totalBill = totalBillView.textField.text,
        let totalBillInt = Int(totalBill) else {return}
        tipsCount = tipsView.collectionView.tipsCount
        let tipsCountFloat = Float(tipsCount) / 100
        let sum = Float(totalBillInt) + Float(totalBillInt) * tipsCountFloat
        let persons = personCountView.stackView.counter
//        if perons == 0 {
//            persons = 1
//        }
        let resultInt = Int(sum)/persons
        result = String(resultInt)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        addArrangedSubview(label)
        addArrangedSubview(image)
        addArrangedSubview(descriptionLabel)
        addArrangedSubview(totalBillView)
        addArrangedSubview(personCountView)
        addArrangedSubview(tipsView)
        addArrangedSubview(calculateButton)
        
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        distribution = .fillProportionally
        alignment = .center
        spacing = 10
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            
            image.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            image.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            
            totalBillView.leadingAnchor.constraint(equalTo: leadingAnchor),
            totalBillView.trailingAnchor.constraint(equalTo: trailingAnchor),
            totalBillView.heightAnchor.constraint(equalToConstant: 110),
            
            personCountView.leadingAnchor.constraint(equalTo: leadingAnchor),
            personCountView.trailingAnchor.constraint(equalTo: trailingAnchor),
            personCountView.heightAnchor.constraint(equalToConstant: 110),
            
            tipsView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tipsView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tipsView.heightAnchor.constraint(equalToConstant: 110),
            
            calculateButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            calculateButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            calculateButton.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    

    
}

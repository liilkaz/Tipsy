//
//  ResultStackView.swift
//  Tipsy
//
//  Created by Лилия Феодотова on 14.02.2023.
//

import UIKit

class ResultStackView: UIStackView {
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Total Per Person"
        label.font = .boldSystemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "moneyRes")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let background: UIView = {
        let background = UIView()
        background.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        background.layer.cornerRadius = 15
        background.translatesAutoresizingMaskIntoConstraints = false
        return background
    }()
    
    let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .boldSystemFont(ofSize: 80)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Split between (2) people, with (10%) tip."
        label.font = .boldSystemFont(ofSize: 15)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 2
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var recalculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Recalculate", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.tintColor = .white
        button.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        button.layer.cornerRadius = 15
        button.addTarget(nil, action: #selector(ResultViewController.recalculateButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
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
        addArrangedSubview(background)
        background.addSubview(resultLabel)
        addArrangedSubview(descriptionLabel)
        addArrangedSubview(recalculateButton)
        
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        distribution = .fill
        alignment = .center
        spacing = 15
        contentMode = .scaleToFill
        
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            image.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            image.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            recalculateButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            recalculateButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            recalculateButton.heightAnchor.constraint(equalToConstant: 60),
            
            resultLabel.centerXAnchor.constraint(equalTo: background.centerXAnchor),
            resultLabel.centerYAnchor.constraint(equalTo: background.centerYAnchor),
            resultLabel.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 10),
            resultLabel.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -10),
            
            background.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            background.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            background.heightAnchor.constraint(equalToConstant: 80),
        ])
    }
    

}

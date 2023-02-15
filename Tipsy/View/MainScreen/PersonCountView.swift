//
//  PersonCountView.swift
//  Tipsy
//
//  Created by Лилия Феодотова on 13.02.2023.
//

import UIKit

class PersonCountView: UIView {

    let label: UILabel = {
        let label = UILabel()
        label.text = "Persons"
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.font = .systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let background: UIView = {
        let background = UIView()
        background.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        background.layer.cornerRadius = 15
        background.translatesAutoresizingMaskIntoConstraints = false
        return background
    }()
    
    let stackView: PersonsCountStackView = {
        let stackView = PersonsCountStackView(frame: .zero)
        return stackView
    }()

    override init(frame: CGRect){
        super.init(frame: frame)
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(label)
        addSubview(background)
        background.addSubview(stackView)
 
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            
            background.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 5),
            background.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            background.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            background.heightAnchor.constraint(equalToConstant: 80),
            
            stackView.topAnchor.constraint(equalTo: background.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: background.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: background.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: background.trailingAnchor),
        ])
    }

}

//
//  PersonsCountStackView.swift
//  Tipsy
//
//  Created by Лилия Феодотова on 13.02.2023.
//

import UIKit

class PersonsCountStackView: UIStackView {
    
    var counter = 1
    
    lazy var minusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("-", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 50)
        button.tintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        button.addTarget(self, action: #selector(plusMinusTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let countPersons: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = .boldSystemFont(ofSize: 40)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 50)
        button.tintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        button.addTarget(self, action: #selector(plusMinusTapped), for: .touchUpInside)
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
        addArrangedSubview(minusButton)
        addArrangedSubview(countPersons)
        addArrangedSubview(plusButton)
        
        
        translatesAutoresizingMaskIntoConstraints = false
        axis = .horizontal
        distribution = .fillProportionally
        alignment = .center
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            
            
           
        ])
    }
    
    @objc func plusMinusTapped(sender: UIButton){
        if sender.titleLabel?.text == "-" {
            if counter > 1{counter -= 1}
        } else {
            counter += 1
        }
        countPersons.text = "\(counter)"
    }
    
}

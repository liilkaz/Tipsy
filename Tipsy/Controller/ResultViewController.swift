//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Лилия Феодотова on 14.02.2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    var result = "0"
    var countPeople = 1
    var tips = 10
    
    let stackView: ResultStackView = {
        let stackView = ResultStackView(frame: .zero)
        return stackView
    }()
    
    @objc func recalculateButtonTapped(_ sender: UIButton){
        self.dismiss(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()

    }
    
    func setupView(){
        view.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        view.addSubview(stackView)
        stackView.resultLabel.text = result
        stackView.descriptionLabel.text = "Split between \(countPeople) people, with \(tips)% tip."
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            stackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
        ])
    }

    

}

//
//  ViewController.swift
//  Tipsy
//
//  Created by Лилия Феодотова on 13.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let stackView: MainStackView = {
        let stackView = MainStackView(frame: .zero)
        stackView.calculateButton.addTarget(nil, action: #selector(calculateButtonTapped2(_:)), for: .touchUpInside)
        return stackView
    }()
    
    
    @objc func calculateButtonTapped2(_ sender: UIButton){
        stackView.calculateButtonTapped()
        
        let resultScreen = ResultViewController()
        resultScreen.result = stackView.result
        resultScreen.countPeople = stackView.personCountView.stackView.counter
        resultScreen.tips = stackView.tipsCount
        self.present(resultScreen, animated: true)
    }
    
    func addTap(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func hideKeyboard(){
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
        addTap()
    }
    
    func setupView(){
        view.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        view.addSubview(stackView)
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


//
//  ViewController.swift
//  gymdiary
//
//  Created by c.toan on 31.07.2023.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    private let trainerButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .orange
        button.setTitle("Я тренер", for: .normal)
        button.addTarget(nil, action: #selector(trainerButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = true
        return button
    }()
    private let clientButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .orange
        button.setTitle("Я спортсмен", for: .normal)
        button.addTarget(nil, action: #selector(clientButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = true
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
    }
    
    //MARK: - Actions
    
    @objc func trainerButtonTapped() {
        let vc = TrainerViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func clientButtonTapped() {
        let vc = UserViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    private func configureUI() {
        view.addSubview(trainerButton)
        view.addSubview(clientButton)
    
        trainerButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(50)
            make.centerY.equalToSuperview()
        }
        
        clientButton.snp.makeConstraints { make in
            make.top.equalTo(trainerButton.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(50)
        }
    }

}


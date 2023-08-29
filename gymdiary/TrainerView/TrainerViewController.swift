//
//  TrainerViewController.swift
//  gymdiary
//
//  Created by c.toan on 03.08.2023.
//

import UIKit
import SnapKit

class TrainerViewController: UIViewController {
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ListOfClientsTableViewCell.self, forCellReuseIdentifier: ListOfClientsTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = true
        return tableView
    }()
    
    private let plusButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "plus")
        let tintedImage = image?.withRenderingMode(.alwaysTemplate)
        button.setImage(tintedImage, for: .normal)
        button.tintColor = .orange
        button.contentMode = .scaleAspectFill
        button.addTarget(nil, action: #selector(plusButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var model = [ClientsModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Тренер"
        
        configureUI()
        
        model.append(ClientsModel(firstName: "Oleg", lastName: "Ivanov", aboutClient: "New", age: 25, image: UIImage(systemName: "person.circle.fill")!))
        model.append(ClientsModel(firstName: "Maria", lastName: "Petrova", aboutClient: "New", age: 25, image: UIImage(systemName: "person.circle.fill")!))
        model.append(ClientsModel(firstName: "Slava", lastName: "Malinin", aboutClient: "New", age: 25, image: UIImage(systemName: "person.circle.fill")!))
        model.append(ClientsModel(firstName: "Evgeny", lastName: "Pushkin", aboutClient: "New", age: 25, image: UIImage(systemName: "person.circle.fill")!))
        model.append(ClientsModel(firstName: "Sam", lastName: "Falcon", aboutClient: "New", age: 25, image: UIImage(systemName: "person.circle.fill")!))
    }
    
    @objc func plusButtonTapped() {
        let newClientsViewController = NewClientsViewController()
        navigationController?.pushViewController(newClientsViewController, animated: true)
    }
    
    private func configureUI() {
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        view.addSubview(plusButton)
        
        tableView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(plusButton.snp.top)
        }
        
        plusButton.snp.makeConstraints { make in
            make.bottom.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.width.equalTo(80)
        }
        
    }
}

extension TrainerViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListOfClientsTableViewCell.identifier, for: indexPath) as? ListOfClientsTableViewCell else { return UITableViewCell() }
        let model = model[indexPath.row]
        cell.configure(with: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//
//  NewClientsViewController.swift
//  gymdiary
//
//  Created by c.toan on 16.08.2023.
//

import UIKit

class NewClientsViewController: UIViewController {
    
    class ClientsItems {
        
        var placeholder: String
        var userInfo: String
        
        init(placeholder: String, userInfo: String) {
            self.placeholder = placeholder
            self.userInfo = userInfo
        }
    }
    
    let model = [ClientsItems(placeholder: "First Name", userInfo: ""),
                 ClientsItems(placeholder: "Last Name", userInfo: ""),
                 ClientsItems(placeholder: "About", userInfo: ""),
                 ClientsItems(placeholder: "Age", userInfo: ""),]
    var newModel = [ClientsItems]()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(NewClientsTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Новый клиент"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(doneButtonDidTapped))
        
        configureUI()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func configureUI() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(view.snp.leading)
            make.center.equalTo(view.center)
        }
    }
    
    @objc func doneButtonDidTapped() {
        print("doneButtonDidTapped")
        model.forEach { client in
            print(client.userInfo)
        }
        navigationController?.popViewController(animated: true)
    }
}

extension NewClientsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? NewClientsTableViewCell else { return UITableViewCell() }
        cell.configure(with: model[indexPath.item])
        return cell
    }
}

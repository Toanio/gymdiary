//
//  NewClientsTableViewCell.swift
//  gymdiary
//
//  Created by c.toan on 25.08.2023.
//

import UIKit

class NewClientsTableViewCell: UITableViewCell {
    private var model: NewClientsViewController.ClientsItems?
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Test"
        textField.addTarget(nil, action: #selector(textDidChange(sender:)), for: .editingChanged)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(textField)
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            textField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            textField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24),
            textField.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: NewClientsViewController.ClientsItems) {
        self.textField.placeholder = model.placeholder
        self.model = model
    }
    
    @objc func textDidChange(sender: UITextField) {
        self.model?.userInfo = sender.text ?? ""
    }
}

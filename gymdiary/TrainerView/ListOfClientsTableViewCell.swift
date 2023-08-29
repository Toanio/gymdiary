//
//  ListOfClientsTableViewCell.swift
//  gymdiary
//
//  Created by c.toan on 04.08.2023.
//

import UIKit
import SnapKit

class ListOfClientsTableViewCell: UITableViewCell {
    static let identifier = "ListOfClientsTableViewCell"
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = true
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    func configure(with model: ClientsModel) {
        self.nameLabel.text = "\(model.firstName) \(model.lastName) "
    }
}

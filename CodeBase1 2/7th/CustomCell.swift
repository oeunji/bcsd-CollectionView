//
//  CustomCell.swift
//  CodeBase1
//
//  Created by 김나훈 on 12/3/24.
//

import UIKit

final class CustomCell: UITableViewCell {
    
    weak var delegate: TableViewController?
    var indexPath: IndexPath?
    
    private let deleteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "delete.left"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(deleteButton)
        
        NSLayoutConstraint.activate([
            deleteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            deleteButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
    }
    
    @objc private func deleteButtonTapped() {
        if let indexPath = indexPath {
            delegate?.confirmAndDeleteRow(at: indexPath)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

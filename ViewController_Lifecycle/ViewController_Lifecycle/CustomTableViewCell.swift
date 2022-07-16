//
//  CustomTableView.swift
//  ViewController_Lifecycle
//
//  Created by Shak Feizi on 7/16/22.
//

import UIKit


class CustomTableViewCell: UITableViewCell {
    //MARK: - Properties
    var titleLable: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    
    var bodyLable: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .blue
        return label
    }()
    
    //MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Functions
    private func setupUIElements() {
        titleLable.frame = CGRect(x: 0, y: 0, width: frame.size.width - 16, height: frame.size.height - 8)
        bodyLable.frame = CGRect(x: 0, y: 0, width: frame.size.width - 16, height: frame.size.height - 8)
        backgroundColor = .white
        addSubview(titleLable)
        addSubview(bodyLable)
    }
}

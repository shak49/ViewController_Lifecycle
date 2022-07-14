//
//  CustomButton.swift
//  ViewController_Lifecycle
//
//  Created by Shak Feizi on 7/14/22.
//

import UIKit


class CustomButton: UIButton {
    //MARK: - Properties
    private let label_One: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private let label_Two: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUIElements()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUIElements()
    }
    
    //MARK: - Functions
    func configure(text_One: String?, text_Two: String?) {
        label_One.text = text_One
        label_Two.text = text_Two
    }
    
    private func setupUIElements() {
        clipsToBounds = false
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.blue.cgColor
        backgroundColor = .systemBlue
        label_One.frame = CGRect(x: 5, y: 0, width: frame.size.width - 10, height: frame.size.height / 2)
        label_Two.frame = CGRect(x: 5, y: frame.size.height / 2, width: frame.size.width - 10, height: frame.size.height / 2)
        addSubview(label_One)
        addSubview(label_Two)
    }
}

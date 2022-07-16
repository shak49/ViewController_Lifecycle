//
//  CustomView.swift
//  ViewController_Lifecycle
//
//  Created by Shak Feizi on 7/16/22.
//

import UIKit


final class CustomView: UIView {
    //MARK: - Properties
    private let view: UITextView = {
        let textView = UITextView()
        textView.textContainer.maximumNumberOfLines = 0
        textView.textAlignment = .center
        textView.textColor = .black
        textView.backgroundColor = .red
        return textView
    }()
    
    //MARK: - Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUIElements()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUIElements()
    }
    
    //MARK: - Functions
    private func setupUIElements() {
        clipsToBounds = true
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.blue.cgColor
        view.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.width)
        addSubview(view)
    }
}


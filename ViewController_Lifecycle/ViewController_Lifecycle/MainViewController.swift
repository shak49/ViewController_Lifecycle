//
//  ViewController.swift
//  ViewController_Lifecycle
//
//  Created by Shak Feizi on 7/14/22.
//

import UIKit

class MainViewController: UIViewController {
    //MARK: - Properties
    var _title: String = "Start free trial"
    var body: String = "3 days trial, then $1.99/mo."
    
    private var customButton: CustomButton!

    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUIElements()
    }

    //MARK: - Functions
    func setupUIElements() {
        customButton = CustomButton(frame: CGRect(x: 0, y: 0, width: 250, height: 55))
        customButton.center = view.center
        customButton.configure(text_One: _title, text_Two: body)
        view.addSubview(customButton)
    }
}


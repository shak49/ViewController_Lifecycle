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
    private var _view: CustomView!

    //MARK: - Lifecycles
    override func loadView() {
        super.loadView()
        // setting up the view for loading to memory
        view.backgroundColor = .red
        setupUIElements()
        print("Load View")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // setting up the view after loading from memory
        print("View Did Load")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("View Will Appear")
    }

    //MARK: - Functions
    func setupUIElements() {
        customButton = CustomButton(frame: CGRect(x: 0, y: 0, width: 250, height: 55))
        customButton.center = view.center
        customButton.configure(text_One: _title, text_Two: body)
        _view = CustomView(frame: CGRect(x: 20, y: 475, width: 350, height: 350))
        view.addSubview(customButton)
        view.addSubview(_view)
    }
}


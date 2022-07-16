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
    
    var users: [Response?] = []
    
    private var customButton: CustomButton!
    private var _view: CustomView!
    private var tableView: UITableView!

    //MARK: - Lifecycles
    override func loadView() {
        super.loadView()
        // setting up the view for loading to memory
        //customButton = CustomButton(frame: CGRect(x: 0, y: 0, width: 250, height: 55))
        //_view = CustomView(frame: CGRect(x: 20, y: 475, width: 350, height: 350))
        tableView = UITableView()
        self.view = tableView
        print("Load View")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // setting up the view after loading from memory
        //view.backgroundColor = .red
        //setupUIElements()
        setupTableView()
        loadData()
        print("View Did Load")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("View Will Appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("View Did Appear")
    }

    //MARK: - Functions
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "UserCell")
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        tableView.center = view.center
    }
    
    func setupUIElements() {
        customButton.center = view.center
        customButton.configure(text_One: _title, text_Two: body)
        view.addSubview(customButton)
        view.addSubview(_view)
    }
    
    func loadData() {
        DispatchQueue.main.async {
            NetworkService.shared.requestData { result in
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let user):
                    guard let user = user else { return }
                    //print(user)
                    self.users.append(user)
                    print(self.users)
                }
            }
            self.tableView.reloadData()
        }
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! CustomTableViewCell
        let user = users[indexPath.row]
        cell.titleLable.text = user?.title
        cell.bodyLable.text = user?.body
        return cell
    }
    
    
}


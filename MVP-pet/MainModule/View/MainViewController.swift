//
//  ViewController.swift
//  MVP-pet
//
//  Created by Eugene Kiselev on 26.02.2021.
//

import UIKit

class MainViewController: UIViewController {
    private var presenter: MainViewPresenterProtocol!
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
}

extension MainViewController {
    private func setup() {
        presenter = MainPresenter(view: self, networkService: NetworkService())
        
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.comments?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let comments = presenter.comments?[indexPath.row]
        
        cell.textLabel?.text = comments?.body
        return cell
    }
}

extension MainViewController: MainViewProtocol {
    func succes() {
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
}


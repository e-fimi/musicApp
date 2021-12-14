//
//  ViewController.swift
//  musicApp
//
//  Created by Георгий on 09.12.2021.
//

import UIKit

class ViewController: UIViewController {

    private let albums = Album.get()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AlbumTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.estimatedRowHeight = 132
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        title = "My Music Player"
        view.addSubview(tableView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? AlbumTableViewCell else {
            return .init()
        }
        
        cell.album = albums[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = MusicPlayerViewController(album: albums[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
        present(vc, animated: true, completion: nil)
    }
}

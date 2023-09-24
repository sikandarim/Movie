//
//  MainViewController+TableView.swift
//  Movie-Swift
//
//  Created by Mariam Sikandari on 2023-07-29.
//


import Foundation
import UIKit

extension MainViewController {
    
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = ThemeColor.bg
        tableView.bounces = false
        
       tableView.register(MovieCell.self, forCellReuseIdentifier: MovieCell.reuseID)
        tableView.rowHeight = MovieCell.rowHeight
        
        tableView.tableFooterView = UIView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

}

 func setupTableHeaderView(){
     
    let header = MovieHeaderVC(frame: .zero)
    var size = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
    size.width = UIScreen.main.bounds.width
    header.frame.size = size
    tableView.tableHeaderView = header
  
}
    func reloadTableView(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}


extension MainViewController:UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.reuseID, for: indexPath) as? MovieCell else {
            return UITableViewCell()
        }
        let cellViewModel = cellDataSource[indexPath.row]
        cell.setupCell(viewModel: cellViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    
    {
        return viewModel.numberOfRows(in: section)

    }
}

extension MainViewController:UITableViewDelegate {
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

         let movieId = cellDataSource[indexPath.row].id
         self.openDetails(movieId: movieId)
         tableView.deselectRow(at: indexPath, animated: false)
    }
}


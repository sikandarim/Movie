//
//  ViewController.swift
//  Movie-Swift
//
//  Created by Mariam Sikandari on 2023-07-29.
//

import UIKit

class MainViewController: UIViewController {
   
    var tableView = UITableView()
    let container = UIView()
    let activityIndicator = UIActivityIndicatorView()
  
    var viewModel:MainViewModel = MainViewModel()
    var cellDataSource: [MovieTableViewCellModel] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = false

        configView()
        bindViewModel()
        setUpIndicator()
    }
    
   
    func configView(){
        self.title = "Movie List"
        self.view.backgroundColor = ThemeColor.bg
      
        setupTableView()
        setupTableHeaderView()
        reloadTableView()
       
    }
    func setUpIndicator(){
        container.frame = CGRect(x: 0, y:0, width: 0, height: 0)
        activityIndicator.style = .large
        activityIndicator.color = .black
        activityIndicator.center = self.view.center
        container.addSubview(activityIndicator)
        self.view.addSubview(container)
    }
    
    
    func bindViewModel(){
    
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let  self = self, let isLoading = isLoading else {
                return
            }
            DispatchQueue.main.async {
                if isLoading {
                    self.tableView.isHidden = true
                    self.activityIndicator.startAnimating()
                    
                } else {
                    self.tableView.isHidden = false
                    self.activityIndicator.stopAnimating()
                }
            }
        }
        
        viewModel.cellDataSource.bind { [weak self] data in
            guard let self = self, let data = data else {
                return
            }
            self.cellDataSource = data
            self.reloadTableView()
            
        }
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getData()
       print(viewModel.getData())
    }
    
    func openDetails(movieId: Int) {
        guard let movie = viewModel.retriveMovie(withId: movieId) else {
            return
        }
        
        DispatchQueue.main.async {
            let detailsViewModel = MovieDetailsViewModel(movie: movie)
            let controller = MovieDetailsViewController(viewModel: detailsViewModel)
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }

}

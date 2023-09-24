//
//  MovieDetailsViewController.swift
//  Movie-Swift
//
//  Created by Mariam Sikandari on 2023-07-29.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    let movieDetailVC = MovieDetailsView()
     
    var viewModel: MovieDetailsViewModel
  
    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.backgroundColor = ThemeColor.bg
        return sv
    }()
    
    lazy var stackView = UIStackView(arrangedSubviews: [ movieDetailVC])
    init(viewModel: MovieDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
       
    }
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Details Movie"
        layout()
        style()
        setUpDetail(viewModel: viewModel)
    }
}

extension MovieDetailsViewController {
    
    func style(){
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .top
        stackView.spacing = 5
    }
    
    func layout(){
 
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
         
         NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor, constant: 8),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.topAnchor.constraint(equalTo:scrollView.topAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: 5),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo:scrollView.widthAnchor)
         ])
        
        
    }
   
}


extension MovieDetailsViewController {
   
    func setUpDetail(viewModel: MovieDetailsViewModel){
        movieDetailVC.titleLabel.text = viewModel.movieTitle
        movieDetailVC.imageheader.downloadImage(with: viewModel.movieImage ?? "")
        movieDetailVC.releaseDateLabel.text = "Release Date: \(viewModel.releaseDate ?? "")"
        movieDetailVC.labelDescriptionExplained.text = viewModel.movieDescription
       
    }
    
}

//
//  MainViewModel.swift
//  Movie-Swift
//
//  Created by Mariam Sikandari on 2023-07-29.
//

import Foundation
class MainViewModel {
    
    var isLoading: Observable <Bool> = Observable(false)
    var dataSource: TrendingMovieModel?
    var cellDataSource: Observable<[MovieTableViewCellModel]> = Observable(nil)
    
    
    func numberOfRows(in section:Int) -> Int {
        return dataSource?.results.count ?? 0
    }
    
    func getData() {
        if isLoading.value ?? true {
            return
        }
        isLoading.value = true
        APICaller.getTrendingMovies { [weak self]result in
            self?.isLoading.value = false
            switch result {
            case .success(let movieList):
                print(movieList)
                self?.dataSource = movieList
                self?.mapCellData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    
    func mapCellData() {
        
        self.cellDataSource.value = self.dataSource?.results.compactMap({MovieTableViewCellModel(movie:$0)})
    }
    
    
    func retriveMovie(withId id: Int) -> Movie? {
        guard let movie = dataSource?.results.first(where: {$0.id == id}) else {
            return nil
        }
        
        return movie
    }
    
    
}

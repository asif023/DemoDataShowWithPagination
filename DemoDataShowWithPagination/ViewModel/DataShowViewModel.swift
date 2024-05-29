//
//  DataShowViewModel.swift
//  DemoDataShowWithPagination
//
//  Created by WemoAshif on 28/05/24.
//

import Foundation
class DataShowViewModel{
     var dataModel = [DataModel]()
     var currentPage = 1
     let limit = 10
     var isLoading = false
     var mainVc :MainViewController? = nil
     func loadPosts() {
        guard !isLoading else { return }
         self.isLoading = true

        NetworkManager.shared.fetchPosts(page: currentPage, limit: limit) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let newPosts):
                    self.dataModel.append(contentsOf: newPosts)
                    self.mainVc?.tableView.reloadData()
                    self.currentPage += 1
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

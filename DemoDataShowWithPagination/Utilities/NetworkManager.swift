//
//  NetworkManager.swift
//  DemoDataShowWithPagination
//
//  Created by WemoAshif on 28/05/24.
//

import Foundation


class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = "https://jsonplaceholder.typicode.com/posts"

    func fetchPosts(page: Int, limit: Int, completion: @escaping (Result<[DataModel], Error>) -> Void) {
        let urlString = "\(baseURL)?_page=\(page)&_limit=\(limit)"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else { return }

            do {
                let posts = try JSONDecoder().decode([DataModel].self, from: data)
                completion(.success(posts))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

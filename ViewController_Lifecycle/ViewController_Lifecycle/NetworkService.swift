//
//  NetworkService.swift
//  ViewController_Lifecycle
//
//  Created by Shak Feizi on 7/16/22.
//

import UIKit


class NetworkService {
    // https://jsonplaceholder.typicode.com/posts
    //MARK: - Properties
    static let shared = NetworkService()
    
    //MARK: - Functions
    func requestData(completion: @escaping(Result<User, NetworkError>) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(.invalidURL))
            }
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                for user in users {
                    //print(user)
                    completion(.success(user))
                }
            } catch {
                completion(.failure(.unableToDecode))
            }
        }
        .resume()
    }
}

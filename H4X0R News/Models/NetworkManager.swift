//
//  NetworkManager.swift
//  H4X0R News
//
//  Created by 橋本一輝 on 2024/09/22.
//

import Foundation

class NetworkManager: ObservableObject {
    @Published var posts = [Post]()
    
    func fetchNews() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {(data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let result = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = result.hits
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}

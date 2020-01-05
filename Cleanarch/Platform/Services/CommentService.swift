//
//  CommentService.swift
//  Cleanarch
//
//  Created by Arifin Firdaus on 12/29/19.
//  Copyright © 2019 arifinfrds. All rights reserved.
//

import Foundation

protocol CommentService {
    func fetchComments(postId: Int, completion: @escaping ((Result<[Comment], Error>) -> Void))
}

class CommentServiceImpl: CommentService {
    
    init() { }
    
    func fetchComments(postId: Int, completion: @escaping ((Result<[Comment], Error>) -> Void)) {
        let urlString = "https://jsonplaceholder.typicode.com/comments?postId=\(postId)"
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, urlResponse, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else { return }
            
            do {
                let comments = try JSON().newJSONDecoder().decode([Comment].self, from: data)
                completion(.success(comments))
            } catch(let error) {
                completion(.failure(error))
            }
        }.resume()
    }
}
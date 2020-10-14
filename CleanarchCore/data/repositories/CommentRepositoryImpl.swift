//
//  CommentRepositoryImpl.swift
//  Cleanarch
//
//  Created by Arifin Firdaus on 12/29/19.
//  Copyright © 2019 arifinfrds. All rights reserved.
//

import Foundation

public class CommentRepositoryImpl: CommentRepository {
    private var service: CommentService?
    
    public init(service: CommentService) {
        self.service = service
    }
    
    public func fetchComments(postId: Int, completion: @escaping ((Result<[Comment], LoadCommentsError>) -> Void)) {
        service?.fetchComments(postId: postId, completion: { result in
            switch result {
            case .success(let comments):
                completion(.success(comments))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}
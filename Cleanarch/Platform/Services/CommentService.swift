//
//  CommentService.swift
//  Cleanarch
//
//  Created by Arifin Firdaus on 12/29/19.
//  Copyright © 2019 arifinfrds. All rights reserved.
//

import Foundation

protocol CommentService {
    func fetchComments(postId: Int, completion: ((Result<[Comment], Error>) -> Void))
}

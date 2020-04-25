//
//  Comment.swift
//  Cleanarch
//
//  Created by Arifin Firdaus on 12/29/19.
//  Copyright © 2019 arifinfrds. All rights reserved.
//

import Foundation

struct Comment: Codable {
    var postID: Int?
    var id: Int?
    var name: String?
    var email: String?
    var body: String?

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case id = "id"
        case name = "name"
        case email = "email"
        case body = "body"
    }
}


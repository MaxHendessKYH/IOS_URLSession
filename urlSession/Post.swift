//
//  Post.swift
//  urlSession
//
//  Created by Max.Hendess on 2024-02-19.
//

import Foundation

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

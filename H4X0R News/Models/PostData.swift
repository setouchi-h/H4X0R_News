//
//  PostData.swift
//  H4X0R News
//
//  Created by 橋本一輝 on 2024/09/22.
//

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String { objectID }
    let objectID: String
    let points: Int
    let num_comments: Int
    let author: String
    let created_at: String
    let _tags: [String]
    let story_id: Int
    let updated_at: String
    let children: [Int]
    
    let _highlightResult: HighlightResult
}

struct HighlightResult: Decodable {
    let title: HighlightDetail
    let author: HighlightDetail
    let url: HighlightDetail?
}

struct HighlightDetail: Decodable {
    let matchLevel: String
    let matchedWords: [String]
    let value: String
}

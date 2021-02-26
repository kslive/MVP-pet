//
//  Person.swift
//  MVP-pet
//
//  Created by Eugene Kiselev on 26.02.2021.
//

import Foundation

struct Comment: Decodable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
}

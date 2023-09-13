//
//  ResponseModel.swift
//  APICallJSON
//
//  Created by Hayk Sakulyan on 11.09.23.
//

import Foundation


struct ResponseModel: Codable, Identifiable {
    var id: Int
    var title: String
    var body: String
}


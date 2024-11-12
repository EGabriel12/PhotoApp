//
//  Photo.swift
//  Photo
//
//  Created by Elias Gabriel dos Santos Correa on 12/11/24.
//

import Foundation

struct Photo: Decodable, Identifiable {
  let id: Int
  let title: String
  let thumbnailUrl: String
}

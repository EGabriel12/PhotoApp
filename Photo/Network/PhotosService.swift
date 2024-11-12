//
//  PhotosService.swift
//  Photo
//
//  Created by Elias Gabriel dos Santos Correa on 12/11/24.
//

import Foundation

class PhotosService {

  let baseURL: URL

  init(baseURL: URL) {
    self.baseURL = baseURL
  }

  func getAllPhotos() async throws -> [Photo] {
//    TDOD: Implement lazy loading
    guard let url = URL(string: "/photos?_start=0&_limit=5", relativeTo: baseURL)  else {
      throw PhotosServiceError.badURL
    }

    let (data, _) = try await URLSession.shared.data(from: url)
    return try JSONDecoder().decode([Photo].self, from: data)
  }

  func getPhotosByPage(page: Int) async throws -> [Photo] {
    let start = page * 15
    guard let url = URL(string: "/photos?_start=\(start)&_limit=15", relativeTo: baseURL)  else {
      throw PhotosServiceError.badURL
    }

    let (data, _) = try await URLSession.shared.data(from: url)
    return try JSONDecoder().decode([Photo].self, from: data)
  }
}

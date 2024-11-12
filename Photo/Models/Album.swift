//
//  Album.swift
//  Photo
//
//  Created by Elias Gabriel dos Santos Correa on 12/11/24.
//

import Foundation

@Observable
class Album {
  var photos: [Photo] = []
  var page: Int = 0
  
  let photosService: PhotosService

  init(photosService: PhotosService) {
    self.photosService = photosService
  }

  func getAllPhotos() async throws {
    self.photos = try await photosService.getAllPhotos()
  }

  func getPhotosByPage() async throws {
    let newPhotos = try await photosService.getPhotosByPage(page: page)
    self.page += 1
    self.photos += newPhotos
  }
}

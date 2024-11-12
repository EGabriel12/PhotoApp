//
//  PhotoApp.swift
//  Photo
//
//  Created by Elias Gabriel dos Santos Correa on 12/11/24.
//

import SwiftUI

@main
struct PhotoApp: App {

  private var service = PhotosService(baseURL: URL(string: "https://jsonplaceholder.typicode.com")!)

  var body: some Scene {
    WindowGroup {
      ContentView()
        .environment(Album(photosService: service))
    }
  }
}

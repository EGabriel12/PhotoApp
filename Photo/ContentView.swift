//
//  ContentView.swift
//  Photo
//
//  Created by Elias Gabriel dos Santos Correa on 12/11/24.
//

import SwiftUI

struct ContentView: View {

  @Environment(Album.self) var album
  @State private var isFinished = false

  var body: some View {
    NavigationStack {
      ScrollView {
        LazyVStack(alignment: .leading) {
          ForEach(album.photos) { photo in
            HStack {
              AsyncImage(url: URL(string: photo.thumbnailUrl)) { phase in
                switch phase {
                  case .failure:
                    Image(systemName: "photo")
                      .font(.largeTitle)
                  case .success(let image):
                    image
                      .resizable()
                  default:
                    ProgressView()
                }
              }
              .frame(width: 75, height: 75)
              .clipShape(.rect(cornerRadius: 25))

              Text(photo.title)
            }
            .padding(.horizontal)
            .contentShape(Rectangle())
          }
          if album.page < 100 {
            ProgressView()
              .frame(maxWidth: .infinity, maxHeight: .infinity)
              .onAppear {
                Task {
                  do {
                    try await album.getPhotosByPage()
                  } catch {
                    print(error.localizedDescription)
                  }
                }
              }
          }
        }
        .navigationTitle("Photos")
      }
    }
  }
}

#Preview {
  ContentView()
    .environment(Album(photosService: PhotosService(baseURL: URL(string: "photo")!)))
}

//
//  ContentView.swift
//  movie-app
//
//  Created by Eva Kiraly on 2025. 04. 08..
//

import SwiftUI

class GenreSectionViewModel: ObservableObject {
    @Published var genres: [Genre] = []
    
    func loadGenres(){
        self.genres = [
            Genre(id: 1, name: "Action"),
            Genre(id: 2, name: "Adventure"),
            Genre(id: 3, name: "Animation"),
            Genre(id: 4, name: "Biography"),
            Genre(id: 5, name: "Comedy"),
            Genre(id: 6, name: "Crime"),
        ]
    }
    
}

struct GenreSectionView: View {
    @StateObject private var viewModel = GenreSectionViewModel()
    
    var body: some View {
        NavigationView{
            List(viewModel.genres){ genre in
                HStack{
                    Text(genre.name)
                        .font(Fonts.title)
                        .foregroundStyle(.primary)
                    Spacer()
                    Image(.rightArrow)
                }
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            //            .navigationTitle("genreSection.title")
            

        }
        .onAppear{
            viewModel.loadGenres()
        }
    }
}

#Preview {
    GenreSectionView()
}

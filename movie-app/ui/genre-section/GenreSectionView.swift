//
//  ContentView.swift
//  movie-app
//
//  Created by Eva Kiraly on 2025. 04. 08..
//

import SwiftUI
import InjectPropertyWrapper

struct GenreSectionView: View {
    @StateObject private var viewModel = GenreSectionViewModelImpl()
    
    var body: some View {
        let title = Environments.name == .tv ? "TV" : "genreSection.title".localized()
        NavigationView {
            ZStack {
                RedEllipse()
                List {
                    if let motd = viewModel.motdMovie {
                        GenreMotdCell(mediaItem: motd)
                            .background(Color.clear)
                            .listStyle(.plain)
                    }
                    
                    ForEach(viewModel.genres) { genre in
                        ZStack {
                            NavigationLink(destination: MediaItemListView(genre: genre)) {
                                EmptyView()
                            }
                            .opacity(0)
                            
                            GenreSectionCell(
                                genre: genre,
                                movies: viewModel.movies[genre.id] ?? [],
                                onExpand: {
                                    viewModel.loadMovies(for: genre)
                                }
                            )
                        }
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                    }
                }
                .listStyle(.plain)
                .navigationTitle(title)
                .accessibilityLabel(AccessibilityLabels.genreSectionCollectionView)
            }
            
        }
        .showAlert(model: $viewModel.alertModel)
        .onAppear{
            viewModel.loadGenres()
            viewModel.genresAppeared()
        }
    }
}

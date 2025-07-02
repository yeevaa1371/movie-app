//
//  FetchMovieRequest.swift
//  movie-app
//
//  Created by Eva Kiraly on 2025. 04. 15..
//

struct FetchMovieRequest {
    let accessToken: String = Config.bearerToken
    let genreId: Int
    
    func asRequestParams() -> [String: Any] {
        return ["with_genres": genreId]
    }
}

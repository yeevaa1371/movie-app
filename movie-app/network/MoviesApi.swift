//
//  MoviesApi.swift
//  movie-app
//
//  Created by Eva Kiraly on 2025. 04. 12..
//

import Foundation
import Moya

enum   MoviesApi{
    case fetchGenres(req: FetchGenreRequest)
}

extension MoviesApi: TargetType {
    var baseURL: URL {
        let baseUrl = "https://api.themoviedb.org/3/"
        guard let baseUlr = URL(string: baseUrl) else {
            preconditionFailure("Base url not valid url")
        }
        return baseUlr
    }
    
    var path: String {
        switch self {
        case .fetchGenres:
            return "genre/movie/list"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchGenres:
            return .get
        }
    }
    var task: Task {
        switch self {
        case let .fetchGenres(req):
            return .requestParameters(parameters: req.asReuquestParams(), encoding: URLEncoding.queryString)
        }
    }
    var headers: [String: String]? {
        switch self{
        case let .fetchGenres(req):
            return ["Authorization": req.accessToken]
        }
    }
}



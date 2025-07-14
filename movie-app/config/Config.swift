//
//  Config.swift
//  movie-app
//
//  Created by Eva Kiraly on 2025. 04. 12..
//

import Foundation

enum Config {
    private static let apiToken: String = {
        guard let path = Bundle.main.path(forResource: "Config", ofType: "plist"),
              let dict = NSDictionary(contentsOfFile: path),
              let token = dict["API_TOKEN"] as? String else {
            preconditionFailure("Config.plist file or API_TOKEN not found")
        }
        return token
    }()
//    private static let accountID: Int = {
//        guard let path = Bundle.main.path(forResource: "Config", ofType: "plist"),
//              let dict = NSDictionary(contentsOfFile: path),
//              let token = dict["ACCOUNT_ID"] as? String else {
//            preconditionFailure("Config.plist file or API_TOKEN not found")
//        }
//        return
//    }()
    
    static var bearerToken: String {
        "Bearer \(apiToken)"
    }
}

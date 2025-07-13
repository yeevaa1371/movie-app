//
//  RedEllipse.swift
//  movie-app
//
//  Created by Eva Kiraly on 2025. 07. 12..
//

import SwiftUI

struct RedEllipse: View {
    var body: some View{
        GeometryReader { geometry in
            Image(.redEllipse)
                .position(x:geometry.size.width-100, y:100)
        }.ignoresSafeArea()
    }
}

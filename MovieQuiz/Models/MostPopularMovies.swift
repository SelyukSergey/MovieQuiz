//
//  MostPopularMovies.swift
//  MovieQuiz
//
//  Created by Сергей Селюк on 23.12.2024.
//

import Foundation

struct MostPopularMovies {
    let errorMessage: String
    let items: [MostPopularMovie]
}

struct MostPopularMovie {
    let title: String
    let rating: String
    let imageURL: URL
}

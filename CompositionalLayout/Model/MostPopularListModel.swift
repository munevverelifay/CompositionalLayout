//
//  MostPopularListModel.swift
//  CompositionalLayout
//
//  Created by Münevver Elif Ay on 16.10.2023.
//

import Foundation

struct MostPopularListModel {
    let coverImage: String
    let restaurantName: String
    let categoryTags: String
}

let mostPopularListMockData = [
    MostPopularListModel(coverImage: "caféDeBambaa", restaurantName: "Café De Bambaa", categoryTags: "Italian-American"),
    MostPopularListModel(coverImage: "burgerbyBella", restaurantName: "Burger By Bella", categoryTags: "Western Food"),
    MostPopularListModel(coverImage: "swedishCoffeePoint", restaurantName: "Swedish Coffee Point", categoryTags: "Western Food"),
    MostPopularListModel(coverImage: "chocolabs", restaurantName: "Chocolabs", categoryTags: "Western Food")
]


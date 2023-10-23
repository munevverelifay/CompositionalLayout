//
//  MostPopularListModel.swift
//  CompositionalLayout
//
//  Created by Münevver Elif Ay on 16.10.2023.
//

struct MostPopularListModel {
    let coverImage: String
    let restaurantName: String
    let restaurantCategoryTags: String
    let categoryTags: String
    let rating: Float
}
let mostPopularListMockData = [
    MostPopularListModel(coverImage: "caféDeBambaa", restaurantName: "Café De Bambaa", restaurantCategoryTags: "Café", categoryTags: "Italian-American", rating: 4.9),
    MostPopularListModel(coverImage: "burgerbyBella", restaurantName: "Burger By Bella", restaurantCategoryTags: "Café", categoryTags: "Western Food", rating: 4.9),
    MostPopularListModel(coverImage: "swedishCoffeePoint", restaurantName: "Swedish Coffee Point", restaurantCategoryTags: "Café", categoryTags: "Western Food", rating: 4.9),
    MostPopularListModel(coverImage: "chocolabs", restaurantName: "Chocolabs", restaurantCategoryTags: "Café", categoryTags: "Western Food", rating: 4.9)
]


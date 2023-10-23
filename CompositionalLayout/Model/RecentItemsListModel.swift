//
//  RecentItemsListModel.swift
//  CompositionalLayout
//
//  Created by Münevver Elif Ay on 16.10.2023.
//

import Foundation

struct RecentItemsListModel {
    let restaurantCoverImage: String
    let restaurantName: String
    let restaurantCategoryTags: String
    let rating: Float
    let ratingsNumber: String
    let categoryTags: String
}

let recentItemsListMockData = [
    RecentItemsListModel(restaurantCoverImage: "mulberryPizzabyJosh", restaurantName: "Mulberry Pizza by Josh", restaurantCategoryTags: "Café", rating: 4.9, ratingsNumber: "(124 ratings)", categoryTags: "Western Food"),
    RecentItemsListModel(restaurantCoverImage: "barita", restaurantName: "Barita", restaurantCategoryTags: "Café", rating: 4.3, ratingsNumber: "(124 ratings)", categoryTags: "Coffee"),
    RecentItemsListModel(restaurantCoverImage: "pizzaRushHour", restaurantName: "Pizza Rush Hour", restaurantCategoryTags: "Café", rating: 4.1, ratingsNumber: "(124 ratings)", categoryTags: "Italian Food"),
]

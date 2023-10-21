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
    let rating: Float
    let ratingsNumber: String
    let tags: String
}

let recentItemsListMockData = [
    RecentItemsListModel(restaurantCoverImage: "mulberryPizzabyJosh", restaurantName: "Mulberry Pizza by Josh", rating: 4.9, ratingsNumber: "(124 ratings) Café ", tags: "Western Food"),
    RecentItemsListModel(restaurantCoverImage: "barita", restaurantName: "Barita", rating: 4.3, ratingsNumber: "(124 ratings) Café ", tags: "Coffee"),
    RecentItemsListModel(restaurantCoverImage: "pizzaRushHour", restaurantName: "Pizza Rush Hour", rating: 4.1, ratingsNumber: "(124 ratings) Café ", tags: "Italian Food"),
]

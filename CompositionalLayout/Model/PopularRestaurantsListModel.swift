//
//  PopularRestaurantsListModel.swift
//  CompositionalLayout
//
//  Created by Münevver Elif Ay on 16.10.2023.
//

struct PopularRestaurantsListModel {
    let restaurantCoverImage: String
    let restaurantName: String
    let rating: Float
    let ratingsNumber: String
    let tags: String
}
let popularRestaurantListMockData = [
    PopularRestaurantsListModel(restaurantCoverImage: "minuteByTukTuk", restaurantName: "Minute by tuk tuk", rating: 4.9, ratingsNumber: "(124 ratings) Café ", tags: "Western Food"),
    PopularRestaurantsListModel(restaurantCoverImage: "caféDeNoir", restaurantName: "Café de Noir", rating: 4.3, ratingsNumber: "(124 ratings) Café ", tags: "Western Food"),
    PopularRestaurantsListModel(restaurantCoverImage: "bakesByTella", restaurantName: "Bakes by Tella", rating: 4.1, ratingsNumber: "(124 ratings) Café ", tags: "Western Food"),
]

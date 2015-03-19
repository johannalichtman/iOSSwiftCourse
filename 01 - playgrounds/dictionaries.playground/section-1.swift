// Playground - noun: a place where people can play

import Cocoa

var movieRatings = ["Donnie Darko": 4, "Chungking Express": 5, "Dark City": 4]
println ("I have rated \(movieRatings.count) movies.")
let darkoRating = movieRatings["Donnie Darko"]
movieRatings["Dark City"] = 5
movieRatings

// update value shows previous value & returns an optional
let oldRating: Int? = movieRatings.updateValue(5, forKey: "Donnie Darko")
if let lastRating = oldRating{
    println(lastRating)
}

movieRatings["The Cabinet of Dr. Caligari"] = 5
//let removedRating: Int? =  movieRatings.removeValueForKey("Dark City")
movieRatings

movieRatings["Dark City"] = nil
movieRatings

//movieRatings["Dark City"]
//removedRating

for (key, value) in movieRatings {
    println("The movie \(key) was rated: \(value).")
}

for movie in movieRatings.keys {
    println("User has rated \(movie)")
}

for ratings in movieRatings.values {
    println("User has rated \(ratings)")
}

let watchedMovies = Array(movieRatings.keys)

let watchedRatingss = Array(movieRatings.values)


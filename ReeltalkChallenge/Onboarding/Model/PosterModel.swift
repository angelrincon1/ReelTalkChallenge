//
//  PosterModel.swift
//  ReeltalkChallenge
//
//  Created by Angel Rincon on 10/11/23.
//

import Foundation

struct Poster: Identifiable {
    let id = UUID()
    let imageLink: String
    let title: String
    let type: String
}

let sampleMoviePosterData = [Poster(imageLink: "", title: "The Shawshank Redemption (1994)", type: "movie"), Poster(imageLink: "", title: "Inception (2010)", type: "movie"), Poster(imageLink: "", title: "Untouchable (2013)", type: "movie"), Poster(imageLink: "", title: "Wall-e (2012)", type: "movie"), Poster(imageLink: "", title: "Reptile (2023)", type: "movie"), Poster(imageLink: "", title: "Split (2016)", type: "movie")]

let sampleSeriesPosterData = [Poster(imageLink: "", title: "Breaking Bad (2008-2013)", type: "series"), Poster(imageLink: "", title: "Band of Brothers (2001)", type: "series"), Poster(imageLink: "", title: "Chernobyl (2019)", type: "series"), Poster(imageLink: "", title: "The Mentalist (2008-2015)", type: "series"), Poster(imageLink: "", title: "Game of Thrones (2011-2019)", type: "series"), Poster(imageLink: "", title: "The Mandalorian (2019-2023)", type: "series")]

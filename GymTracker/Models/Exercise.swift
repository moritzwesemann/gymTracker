//
//  Exercise.swift
//  GymTracker
//
//  Created by Moritz on 04.02.23.
//

import Foundation


struct Exercise: Codable{
    var title: String
    var sets: Int
    var reps: Int
    var weight: [Int: Int]
}

//
//  SessionModel.swift
//  GymTracker
//
//  Created by Moritz on 31.01.23.
//

import Foundation

struct Session: Codable{
    
    var title: String
    var date: Date
    var other: String
    var exercises: [Exercise] = []
    
    static var archiveURL: URL {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentsURL.appendingPathComponent("session").appendingPathExtension("plist")
        
        return archiveURL
    }
    
    static func saveToFiles(sessions: [Session]){
        let encoder = PropertyListEncoder()
        do {
            let encodedSessions = try encoder.encode(sessions)
            try encodedSessions.write(to: Session.archiveURL)
        } catch {
            print("Error encoding sessions: \(error)")
        }
    }
    
    static func loadFromFile() -> [Session]? {
        guard let sessionData = try? Data(contentsOf: Session.archiveURL) else {
            return nil
        }
        
        do {
            let decoder = PropertyListDecoder()
            let decodedSessions = try decoder.decode([Session].self, from: sessionData)
            
            return decodedSessions
        } catch {
            print("Error decoding sessions: \(error)")
            return nil
        }
    }
}



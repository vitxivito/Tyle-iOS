//
//  Post.swift
//  Tyle
//
//  Created by Vitoria Garcia on 27/1/25.
//
import Firebase
import Foundation

struct Post: Hashable {
    let caption: String
    let date: Date
    let img: String
    let userId: String
    
    init?(document: [String: Any]) {
        guard let caption = document["caption"] as? String,
              let timestamp = document["date"] as? Timestamp,
              let img = document["img"] as? String,
              let userId = document["user-id"] as? String else {
            return nil
        }
        
        self.caption = caption
        self.date = timestamp.dateValue()
        self.img = img
        self.userId = userId
    }
    init( caption: String, date: Date, img: String, userId: String){
        self.caption = caption
        self.date = date
        self.img = img
        self.userId = userId
    }
}

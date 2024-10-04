//
//  KnowledgeModel.swift
//  AppleFoundationResources
//
//  Created by HSIN on 4/10/2024.
//

import Foundation

struct Knowledge: Identifiable {
    let id: String;
    let title: String;
    let details: String;
    let url: String;
    let isSaved: Bool;
    let image: String;
    let category: String;
    
    init(id: String = UUID().uuidString, title: String, details: String, url: String, isSaved: Bool, image: String, category: String) {
        self.id = id;
        self.title = title;
        self.details = details;
        self.url = url;
        self.isSaved = isSaved;
        self.image = image;
        self.category = category;
    }
}

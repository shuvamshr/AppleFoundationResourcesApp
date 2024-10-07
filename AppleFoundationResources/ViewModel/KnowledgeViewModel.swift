//
//  KnowledgeViewModel.swift
//  AppleFoundationResources
//
//  Created by HSIN on 4/10/2024.
//

import Foundation
import Combine

extension KnowledgeView {
    class ViewModel: ObservableObject {
        private(set) var knowledgeList: [Knowledge] = [Knowledge]()
        private(set) var errorMessage: String?
    
        
        init() {
            getSampleData()
        }
        
        func getSampleData() {
            let sampleData = [
                Knowledge(title: "Swift Programming Language", details: "Basic syntax and features", url: "https://developer.apple.com/swift/", isSaved: false, image: "https://developer.apple.com/swift/images/swift-og.png", category: "foundation"),
                Knowledge(title: "UIKit Framework", details: "Core UI components", url: "https://developer.apple.com/documentation/uikit/", isSaved: false, image: "https://getuikit.com/images/uikit-meta.png", category: "foundation"),
                Knowledge(title: "Model-View-Controller (MVC)", details: "Design pattern for architecture", url: "https://www.youtube.com/watch?v=0PnQTeNzrLI", isSaved: false, image: "https://i3.ytimg.com/vi/0PnQTeNzrLI/maxresdefault.jpg", category: "foundation"),
                Knowledge(title: "Auto Layout", details: "Responsive layout design", url: "https://www.youtube.com/watch?v=4qPcMGiSADA", isSaved: false, image: "https://i3.ytimg.com/vi/4qPcMGiSADA/maxresdefault.jpg", category: "foundation"),
                Knowledge(title: "Networking", details: "Making network requests", url: "https://www.youtube.com/watch?v=ERr0GXqILgc", isSaved: false, image: "https://i3.ytimg.com/vi/ERr0GXqILgc/maxresdefault.jpg", category: "foundation"),
                
                Knowledge(title: "SwiftUI", details: "Declarative UI building", url: "https://www.youtube.com/watch?v=sZSlTDlo0Ag", isSaved: false, image: "https://i3.ytimg.com/vi/sZSlTDlo0Ag/maxresdefault.jpg", category: "intermediate"),
                Knowledge(title: "Persistence", details: "Data storage options", url: "https://www.youtube.com/watch?v=1QOLiELlpGk", isSaved: false, image: "https://i3.ytimg.com/vi/1QOLiELlpGk/maxresdefault.jpg", category: "intermediate"),
                Knowledge(title: "Concurrency", details: "Asynchronous programming basics", url: "https://www.youtube.com/watch?v=XRulkUR1O5Q", isSaved: false, image: "https://i3.ytimg.com/vi/XRulkUR1O5Q/maxresdefault.jpg", category: "intermediate"),
                Knowledge(title: "App Lifecycle", details: "Managing app states", url: "https://www.youtube.com/watch?v=HrlMi4civMI", isSaved: false, image: "https://i3.ytimg.com/vi/HrlMi4civMI/maxresdefault.jpg", category: "intermediate"),
                Knowledge(title: "Testing", details: "Unit and UI tests", url: "https://www.youtube.com/watch?v=GBNHGOVi5fg", isSaved: false, image: "https://i3.ytimg.com/vi/GBNHGOVi5fg/maxresdefault.jpg", category: "intermediate"),
                
                Knowledge(title: "App Extensions", details: "Managing app extensions", url: "https://www.youtube.com/watch?v=Gi47Oi8gKJE", isSaved: false, image: "https://i3.ytimg.com/vi/Gi47Oi8gKJE/maxresdefault.jpg", category: "advanced"),
                Knowledge(title: "Swift Package Manager", details: "Managing dependencies effectively", url: "https://www.youtube.com/watch?v=zK00FbZOxsk", isSaved: false, image: "https://i3.ytimg.com/vi/zK00FbZOxsk/maxresdefault.jpg", category: "advanced"),
                Knowledge(title: "Implementing CloudKit", details: "Store Data on Cloud", url: "https://www.youtube.com/watch?v=mXGg-iwZNUA", isSaved: false, image: "https://i3.ytimg.com/vi/mXGg-iwZNUA/maxresdefault.jpg", category: "advanced"),
                Knowledge(title: "Architectural Patterns", details: "Exploring design patterns", url: "https://www.youtube.com/watch?v=aoFuTyXAbmE", isSaved: false, image: "https://i3.ytimg.com/vi/aoFuTyXAbmE/maxresdefault.jpg", category: "advanced"),
                Knowledge(title: "App Store Deployment", details: "Launch your app live", url: "https://www.youtube.com/watch?v=fXeDe9tafG8", isSaved: false, image: "https://i3.ytimg.com/vi/fXeDe9tafG8/maxresdefault.jpg", category: "advanced")
            ]
            
            
            
            knowledgeList = sampleData
        }
        
        func getKnowledgeList(by category: String) -> [Knowledge] {
            return knowledgeList.filter { $0.category == category }
        }
        
        func getSearchResultList(by keyword: String) -> [Knowledge] {
            return knowledgeList.filter { $0.title.contains(keyword) }
        }
        
        func getKnowledgeListBySaved() -> [Knowledge] {
            return knowledgeList.filter { savedList.contains($0.id) }
        }
        
        // TODO: Make Save Functionality Work
        
        private(set) var savedList = [String]()
        
        func retrieveList() -> [String] {
            return UserDefaults.standard.array(forKey: "savedList") as? [String] ?? []
        }
        
        func saveList(_ list: [String]) {
            UserDefaults.standard.set(list, forKey: "savedList")
        }
        
        func appendToList(newItem: String) {
            var savedList = retrieveList() // Get the current list
            savedList.append(newItem)       // Append the new item
            saveList(savedList)             // Save the updated list
        }
        
    }
}

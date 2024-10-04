//
//  KnowledgeViewModel.swift
//  AppleFoundationResources
//
//  Created by HSIN on 4/10/2024.
//

import Foundation

extension KnowledgeView {
    class ViewModel: ObservableObject {
        private(set) var knowledgeList: [Knowledge] = [Knowledge]()
    
        init() {
            getSampleData()
        }
        
        func getSampleData() {
            let sampleData = [
                Knowledge(title: "Swift Programming Language", details: "Basic syntax and features", url: "https://developer.apple.com/swift/", isSaved: false, image: "https://developer.apple.com/swift/images/swift-og.png", category: "foundation"),
                Knowledge(title: "UIKit Framework", details: "Core UI components", url: "https://developer.apple.com/documentation/uikit/", isSaved: false, image: "https://getuikit.com/images/uikit-meta.png", category: "foundation"),
                Knowledge(title: "Model-View-Controller (MVC)", details: "Design pattern for architecture", url: "", isSaved: false, image: "https://upload.wikimedia.org/wikipedia/commons/5/56/Model_View_Controller_%28MVC%29.svg", category: "foundation"),
                Knowledge(title: "Auto Layout", details: "Responsive layout design", url: "", isSaved: false, image: "https://developer.apple.com/assets/elements/icons/auto-layout/auto-layout.svg", category: "foundation"),
                Knowledge(title: "Networking", details: "Making network requests", url: "", isSaved: false, image: "https://upload.wikimedia.org/wikipedia/commons/b/bf/Network-architecture.svg", category: "foundation"),
                
                Knowledge(title: "SwiftUI", details: "Declarative UI building", url: "", isSaved: false, image: "https://developer.apple.com/assets/elements/icons/swiftui/swiftui.svg", category: "intermediate"),
                Knowledge(title: "Persistence", details: "Data storage options", url: "", isSaved: false, image: "https://upload.wikimedia.org/wikipedia/commons/b/b2/Database_symbol.svg", category: "intermediate"),
                Knowledge(title: "Concurrency", details: "Asynchronous programming basics", url: "", isSaved: false, image: "https://upload.wikimedia.org/wikipedia/commons/b/b3/Concurrency_icon.svg", category: "intermediate"),
                Knowledge(title: "App Lifecycle", details: "Managing app states", url: "", isSaved: false, image: "https://upload.wikimedia.org/wikipedia/commons/3/36/App_Lifecycle.png", category: "intermediate"),
                Knowledge(title: "Testing", details: "Unit and UI tests", url: "", isSaved: false, image: "https://upload.wikimedia.org/wikipedia/commons/1/1d/Testing_Icon.png", category: "intermediate"),
                
                Knowledge(title: "App Extensions", details: "Managing app extensions", url: "", isSaved: false, image: "https://upload.wikimedia.org/wikipedia/commons/a/a8/App_extensions_icon.png", category: "advanced"),
                Knowledge(title: "Swift Package Manager", details: "Managing dependencies effectively", url: "", isSaved: false, image: "https://upload.wikimedia.org/wikipedia/commons/5/5c/Swift_package_manager_icon.svg", category: "advanced"),
                Knowledge(title: "Advanced Networking", details: "Complex networking scenarios", url: "", isSaved: false, image: "https://upload.wikimedia.org/wikipedia/commons/a/a5/Networking_concept.svg", category: "advanced"),
                Knowledge(title: "Architectural Patterns", details: "Exploring design patterns", url: "", isSaved: false, image: "https://upload.wikimedia.org/wikipedia/commons/7/70/Architectural_pattern.svg", category: "advanced"),
                Knowledge(title: "Performance Optimization", details: "Optimizing app performance", url: "", isSaved: false, image: "https://upload.wikimedia.org/wikipedia/commons/b/bc/Optimization_icon.svg", category: "advanced")
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

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
        
        private(set) var savedList = [String]()
        
        init() {
            getSampleData()
            savedList = retrieveList()
        }
        
        func getSampleData() {
            let sampleData = [
                Knowledge(title: "Human Interface Guideline", details: "Apple's Design Resource Guide", url: "https://www.google.com", isSaved: false, image: "https://docs-assets.developer.apple.com/published/f630248869246f4f877a49f6b285b875/components-controls-intro@2x.png", category: "interface"),
                Knowledge(title: "Human Interface Guideline", details: "Apple's Design Resource Guide", url: "https://www.google.com", isSaved: true, image: "https://docs-assets.developer.apple.com/published/f630248869246f4f877a49f6b285b875/components-controls-intro@2x.png", category: "interface"),
                Knowledge(title: "Human Interface Guideline", details: "Apple's Design Resource Guide", url: "https://www.google.com", isSaved: true, image: "https://docs-assets.developer.apple.com/published/f630248869246f4f877a49f6b285b875/components-controls-intro@2x.png", category: "interface"),
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

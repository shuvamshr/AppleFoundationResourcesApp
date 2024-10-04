//
//  SavedKnowledgeView.swift
//  AppleFoundationResources
//
//  Created by HSIN on 4/10/2024.
//

import SwiftUI

struct SavedKnowledgeView: View {
    let knowledgeList: [Knowledge]
    var body: some View {
        KnowledgeCardPlainList( knowledgeList: knowledgeList)
            .padding(.horizontal)
            .navigationTitle("Saved List")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct SavedKnowledgeView_Previews: PreviewProvider {
    static var previews: some View {
        SavedKnowledgeView(knowledgeList: [ Knowledge(title: "Human Interface Guideline", details: "Apple's Design Resource Guide", url: "www.google.com", isSaved: true, image: "INF001", category: "interface"), Knowledge(title: "Human Interface Guideline", details: "Apple's Design Resource Guide", url: "www.google.com", isSaved: true, image: "INF001", category: "interface")])
    }
}

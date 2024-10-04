//
//  CategoryKnowledgeView.swift
//  AppleFoundationResources
//
//  Created by HSIN on 4/10/2024.
//

import SwiftUI

struct CategoryKnowledgeView: View {
    let title: String
    let knowledgeList: [Knowledge]
    
    var body: some View {
        KnowledgeCardPlainList( knowledgeList: knowledgeList)
            .padding(.horizontal)
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct CategoryKnowledgeView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryKnowledgeView(title: "Interface", knowledgeList: [Knowledge(title: "Human Interface Guideline", details: "Apple's Design Resource Guide", url: "www.google.com", isSaved: true, image: "INF001", category: "interface"), Knowledge(title: "Human Interface Guideline", details: "Apple's Design Resource Guide", url: "www.google.com", isSaved: true, image: "INF001", category: "interface")])
    }
}

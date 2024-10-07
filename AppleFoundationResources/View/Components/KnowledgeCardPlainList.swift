//
//  KnowledgeCardPlainList.swift
//  AppleFoundationResources
//
//  Created by HSIN on 4/10/2024.
//

import SwiftUI

struct KnowledgeCardPlainList: View {
    let knowledgeList: [Knowledge]
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(knowledgeList){item in
                    KnowledgeCard(knowledge: item, isLargeCard: true)
                }
            }
            .padding(.vertical)
        }
        .scrollIndicators(.hidden)
    }
}

struct KnowledgeCardPlainList_Previews: PreviewProvider {
    static var previews: some View {
        KnowledgeCardPlainList(knowledgeList: [ Knowledge(title: "Human Interface Guideline", details: "Apple's Design Resource Guide", url: "www.google.com", isSaved: true, image: "INF001", category: "interface"), Knowledge(title: "Human Interface Guideline", details: "Apple's Design Resource Guide", url: "www.google.com", isSaved: true, image: "INF001", category: "interface")])
    }
}

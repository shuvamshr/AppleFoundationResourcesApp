//
//  KnowledgeCardDetailList.swift
//  AppleFoundationResources
//
//  Created by HSIN on 4/10/2024.
//

import SwiftUI

struct KnowledgeCardDetailList: View {
 
    let title: String;
    let details: String;
    let knowledgeList: [Knowledge]
    @State private var searchTerm = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(title)
                            .font(.title3)
                            .fontWeight(.bold)
                        Text(details)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                    NavigationLink {
                        CategoryKnowledgeView(title: title, knowledgeList: knowledgeList)
                    } label: {
                        Text("See All")
                    }
                }
                .padding(.horizontal)
                .padding(.top)
        
            ScrollView(.horizontal){
                
                HStack(spacing: 16) {
                    ForEach(knowledgeList){item in
                        KnowledgeCard(knowledge: item, isLargeCard: false, onSaveToggle: {print("Card Pressed")})
                    }
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
            .scrollIndicators(.hidden)
        }
    }
}

struct KnowledgeCardDetailList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            KnowledgeCardDetailList(title: "Interface", details: "Get the girst of design from Apple",  knowledgeList: [ Knowledge(title: "Human Interface Guideline", details: "Apple's Design Resource Guide", url: "www.google.com", isSaved: true, image: "INF001", category: "interface"), Knowledge(title: "Human Interface Guideline", details: "Apple's Design Resource Guide", url: "www.google.com", isSaved: true, image: "INF001", category: "interface")])
        }
    }
}

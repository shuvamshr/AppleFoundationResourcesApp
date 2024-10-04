//
//  KnowledgeCard.swift
//  AppleFoundationResources
//
//  Created by HSIN on 4/10/2024.
//

import SwiftUI
import WebKit

struct KnowledgeCard: View {
    let knowledge: Knowledge
    let isLargeCard: Bool
    let onSaveToggle: () -> Void
    
    @State private var viewModel = KnowledgeView.ViewModel()
    
    @State private var animationAmount: CGFloat = 0.0
    
    var body: some View {
        NavigationLink {
            WebView(url: knowledge.url)
                .navigationTitle(knowledge.title)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    Button {
                        viewModel.appendToList(newItem: knowledge.id)
                    } label: {
                        Image(systemName: knowledge.isSaved ? "bookmark.fill" : "bookmark")
                            .foregroundStyle(Color.accentColor)
                    }
                }
        } label: {
            VStack(alignment: .leading) {
                ZStack(alignment: .topTrailing) {
                    AsyncImage(url: URL(string: knowledge.image)) { image in
                        image.resizable()
                            .scaledToFill()
                            .frame(width: isLargeCard ? .infinity : 280, height: 160)
                            .clipShape(
                                RoundedRectangle(cornerRadius: isLargeCard ? 8 : 12)
                            )
                    } placeholder: {
                        RoundedRectangle(cornerRadius: isLargeCard ? 8 : 12)
                            .fill(LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.3), Color.gray.opacity(0.5)]), startPoint: .top, endPoint: .bottom))
                            .frame(width: isLargeCard ? .infinity : 280, height: 160)
                            .overlay(
                                LinearGradient(gradient: Gradient(colors: [Color.clear, Color.white.opacity(0.2), Color.clear]), startPoint: .leading, endPoint: .trailing)
                                    .mask(RoundedRectangle(cornerRadius: isLargeCard ? 8 : 12))
                                    .offset(x: animationAmount)
                                    .animation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false), value: animationAmount)
                            )
                            .onAppear {
                                animationAmount = 280 // Adjust this based on your frame width
                            }
                    }
                    if(knowledge.isSaved){ Image(systemName: "bookmark.fill")
                            .font(.largeTitle)
                            .foregroundStyle(Color.accentColor)
                            .padding(.horizontal, 12)
                            .padding(.vertical, -4)
                    }
                }
                VStack(alignment: .leading, spacing: 2) {
                    Text(knowledge.title)
                        .font(.headline)
                    Text(knowledge.details)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .buttonStyle(.plain)
        
    }
    
    
    func handleSaveToggle() {
        
    }
}

struct KnowledgeCard_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            KnowledgeCard(knowledge: Knowledge(title: "Human Interface Guideline", details: "Apple's Design Resource Guide", url: "https://www.google.com", isSaved: true, image: "INF001", category: "interface"), isLargeCard: true, onSaveToggle: { print("Hi") })
        }
    }
}


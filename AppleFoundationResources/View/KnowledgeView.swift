//
//  KnowledgeView.swift
//  AppleFoundationResources
//
//  Created by HSIN on 4/10/2024.
//

import SwiftUI

struct KnowledgeView: View {
    @State private var viewModel = ViewModel()
    
    @State private var searchKeyword = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                KnowledgeCardDetailList(title: "Foundation Skills", details: "Learn the basics for your app", knowledgeList: viewModel.getKnowledgeList(by: "foundation"))
                Divider()
                    .padding(.horizontal)
                KnowledgeCardDetailList(title: "Intermediate Concepts", details: "Enhance your app with more details", knowledgeList: viewModel.getKnowledgeList(by: "intermediate"))
                Divider()
                    .padding(.horizontal)
                KnowledgeCardDetailList(title: "Advanced Development", details: "Get your app ready with complex tools", knowledgeList: viewModel.getKnowledgeList(by: "advanced"))
            }
            .navigationTitle("Knowledge")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        NavigationLink {
                            SavedKnowledgeView(knowledgeList: viewModel.getKnowledgeListBySaved())
                        } label: {
                            HStack {
                                Image(systemName: "bookmark.fill")
                                Text("Saved List (\(viewModel.getKnowledgeListBySaved().count))")
                                    .fontWeight(.semibold)
                            }
                        }
                        Spacer()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Menu {
                        Section {
                            NavigationLink {
                                AccessCredentialsView()
                            } label: {
                                Label("Access Credentials", systemImage: "lock.square.stack.fill")
                            }
                        }
                        Section {
                            NavigationLink {
                                SettingsView()
                            } label: {
                                Label("Settings", systemImage: "gearshape.fill")
                            }
                            NavigationLink {
                                AboutView()
                            } label: {
                                Label("About", systemImage: "info.circle.fill")
                            }
                        }
                    } label: {
                        Label("Option", systemImage: "ellipsis.circle")
                    }
                }
            }
            .searchable(text: $searchKeyword) {
                if(searchKeyword.isEmpty){
                    KnowledgeCardPlainList(knowledgeList: viewModel.knowledgeList)
                } else {
                    KnowledgeCardPlainList(knowledgeList: viewModel.getSearchResultList(by: searchKeyword))
                }
            }
        }
    }
    
}

struct KnowledgeView_Previews: PreviewProvider {
    static var previews: some View {
        KnowledgeView()
    }
}

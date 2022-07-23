//
//  MainChat.swift
//  ProyectoFinaliPhone
//
//  Created by Ronald on 22/07/22.
//

import SwiftUI

struct MainChat: View {
    
    @StateObject var viewModel = ChatsViewModel()
    
    @State private var query = ""

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.getFilteredChats(query: query)) { chat in
                    ZStack {
                        ChatRows(chat: chat)
                        
                       
                        NavigationLink(destination: ChatView(chat: chat).environmentObject(viewModel)) {}
                        .buttonStyle(PlainButtonStyle())
                        .frame(width:0)
                        .opacity(0)
                    }
                    .swipeActions(edge: .leading, allowsFullSwipe: true) {
                        Button(action: {
                            viewModel.markAsUnread(!chat.hasUnreadMessage, chat: chat)
                        }) {
                            if chat.hasUnreadMessage {
                                Label("Read", systemImage: "text.bubble")
                            } else {
                                Label("Read", systemImage: "circle.fill")
                            }
                        }
                        .tint(.blue)
                    }
                }
            }
            .listStyle(PlainListStyle())
            .searchable(text: $query)
            .navigationTitle("Conversaciones")
        }
    }
}

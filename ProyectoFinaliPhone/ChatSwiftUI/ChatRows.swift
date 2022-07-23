//
//  ChatRows.swift
//  ProyectoFinaliPhone
//
//  Created by Ronald on 22/07/22.
//

import SwiftUI

struct ChatRows: View {
    
    let chat: Chat

    var body: some View {
        HStack(spacing: 17) {
            Image(chat.person.imgString)
                .resizable()
                .frame(width: 70, height: 70)
                .clipShape(Circle())
            
            ZStack {
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(chat.person.name)
                            .bold()
                        Spacer()
                        Text(chat.messages.last?.date.descriptiveString() ?? "")
                            .foregroundColor(chat.hasUnreadMessage ? .blue : .gray)
                    }
                    
                    HStack {
                        Text(chat.messages.last?.text ?? "")
                            .foregroundColor(.gray)
                            .lineLimit(2)
                            .frame(height: 50, alignment: .top)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.trailing, 40)
                    }
                }
                
                Circle()
                    .foregroundColor(chat.hasUnreadMessage ? .blue : .clear)
                    .frame(width: 20, height: 20)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
        .frame(height: 80)
    }
}

struct ChatRows_Previews: PreviewProvider {
        
        static let chat = Chat(person: Person(name: "Lorenz", imgString: "red"),
                               messages: [Message("Hey flo, how are you?", type: .Received)],
                               hasUnreadMessage: true)
        
        static var previews: some View {
            ChatRows(chat: chat)
                .padding(.horizontal)
        }
}

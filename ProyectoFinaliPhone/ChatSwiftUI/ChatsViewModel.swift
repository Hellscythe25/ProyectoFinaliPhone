//
//  ChatsViewModel.swift
//  ProyectoFinaliPhone
//
//  Created by Ronald on 23/07/22.
//

import Foundation

class ChatsViewModel: ObservableObject {
    
    @Published var chats = Chat.sampleChat
    
    func sendMessage(_ text: String, in chat: Chat) -> Message? {
        if let index = chats.firstIndex(where: { $0.id == chat.id }) {
            let message = Message(text, type: .Sent)
            chats[index].messages.append(message)
            return message
        }
        return nil
    }
    
    func markAsUnread(_ newValue: Bool, chat: Chat) {
        if let index = chats.firstIndex(where: { $0.id == chat.id }) {
            chats[index].hasUnreadMessage = newValue
        }
    }
    
    
    func getFilteredChats(query: String) -> [Chat] {
        let sortedChats = chats.sorted {
            guard let date1 = $0.messages.last?.date else { return false }
            guard let date2 = $1.messages.last?.date else { return false }
            return date1 > date2
        }
        
        if query == "" {
            return sortedChats
        }
        return sortedChats.filter { $0.person.name.lowercased().contains(query.lowercased()) }
    }
    
    
    func getSectionMessages(for chat: Chat) -> [[Message]] {
        var res = [[Message]]()
        var tmp = [Message]()
        for message in chat.messages {
            if let firstMessage = tmp.first {
                let daysBetween = firstMessage.date.daysBetween(date: message.date)
                if daysBetween >= 1 {
                    res.append(tmp)
                    tmp.removeAll()
                    tmp.append(message)
                } else {
                    tmp.append(message)
                }
            } else {
                tmp.append(message)
            }
        }
        res.append(tmp)
        
        return res
    }
}

extension Chat {
    
    static let sampleChat = [
        Chat(person: Person(name: "Merida", imgString: "red"), messages: [
            Message("Buenos dias", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("Espero se encuentre bien", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("La verdad es que si esta bien todo", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("Estoy realizando pruebas de ios", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("No me jale profesor", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
        ], hasUnreadMessage: true),
        
        Chat(person: Person(name: "Hugo QR", imgString: "red"), messages: [
            Message("Hola Hugo", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 5)),
            Message("Buenos dias estimado ", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("Estare realizando unas pruebas", type: .Received, date: Date()),
        ]),
        
        Chat(person: Person(name: "Andre Miraval", imgString: "red"), messages: [
            Message("Como estas", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("Muy bien gracias y tu?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("No me puedo quejar", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("Que te vaya genial", type: .Received),
        ], hasUnreadMessage: true),
        
        Chat(person: Person(name: "Romesh", imgString: "red"), messages: [
            Message("Hey Romesh, te saluda tu prmo", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 4)),
            Message("hola primo como estas", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 4)),
            Message("Todo bien, estoy realizando unas pruebas", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2))
        ]),
        
        Chat(person: Person(name: "Duna Mark", imgString: "red"), messages: [
            Message("Hola Duna", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("Hola buenas tardes", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("Creo que esta funcionando correctamente", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("Lorem ipsum socalim asfarit", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("Si, funciona de maravilla 😍", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
        ]),
        
        Chat(person: Person(name: "Sandeep", imgString: "red"), messages: [
            Message("Hey buddy, what are you doing?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 10)),
            Message("I'm just learning SwiftUI. Do you know the awesome online course called Hacking With SwiftUI?", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 10)),
            Message("Oh yeah, this course is awesome. I have completed it and I can fully recommend it as well 🙏", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 9)),
        ]),
        
        Chat(person: Person(name: "Wayne D.", imgString: "red"), messages: [
            Message("Hey Wayne, I just want to say thank you so much for your support on Patreon 🙏", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 4)),
            Message("I hope you will read this ☺️", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 4)),
        ]),
    ]
}

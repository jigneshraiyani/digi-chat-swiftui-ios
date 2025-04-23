//
//  ChatView.swift
//  Digi-Chat
//
//  Created by Raiyani Jignesh on 11/29/24.
//

import SwiftUI
import Combine

// MARK: - ChatView

struct ChatView: View {
    @StateObject var viewModel: ChatViewModel
    let user: User
    
    let sendMessageIcon = "paperplane"
    let sendMessagePlaceHolder = "Send a message"
    
    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.messages, id: \.self) { message in
                            ChatMessageView(currentMessage: message)
                                .id(message)
                        }
                    }
                    .onReceive(Just(viewModel.messages)) { _ in
                        withAnimation {
                            proxy.scrollTo(viewModel.messages.last,
                                           anchor: .bottom)
                        }
                    }.onAppear {
                        withAnimation {
                            proxy.scrollTo(viewModel.messages.last,
                                           anchor: .bottom)
                        }
                    }
                }
                footerView
                    .padding()
            }
        }
        .navigationTitle(user.name)
    }
}

extension ChatView {
    var footerView: some View {
        HStack {
            TextField(sendMessagePlaceHolder,
                      text: $viewModel.newMessage)
            .textFieldStyle(.roundedBorder)
            Button(action: viewModel.sendMessage)   {
                Image(systemName: sendMessageIcon)
            }
        }
    }
}

//struct ChatView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChatView(user: <#User#>)
//    }
//}

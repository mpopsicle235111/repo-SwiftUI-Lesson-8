//
//  FriendsView.swift
//  Swift-UI-Hometask-2.0
//
//  Created by Anton Lebedev on 02.05.2022.
//  Table created as per: https://habr.com/ru/post/461645/
//  Navigation as per: https://www.hackingwithswift.com/quick-start/swiftui/how-to-push-a-new-view-when-a-list-row-is-tapped

import SwiftUI

struct FriendsView: View {
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var showFriendsState: ShowFriendsState
    @ObservedObject var viewModel: FriendsViewModel
    
    init(viewModel: FriendsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        

            List(viewModel.friendsAPI.sorted(by: { $0.lastName < $1.lastName})) { friendAPI in
                NavigationLink(destination: PhotosView(viewModel: PhotosViewModel(friend: FriendAPI.init(canAccessClosed: friendAPI.canAccessClosed, domain: friendAPI.domain, city: friendAPI.city, id: friendAPI.id, photo100: friendAPI.photo100, lastName: friendAPI.lastName, photo50: friendAPI.photo50, trackCode: friendAPI.trackCode, isClosed: friendAPI.isClosed, firstName: friendAPI.firstName), api: PhotosAPI() ))) {

                    FriendCellView(friendAPI: friendAPI)
                    }
                }
               .onAppear { viewModel.fetch() }
         }
         
    }
    
    




struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        //FriendsView(viewModel: FriendsViewModel(api: FriendsAPI))
        FriendsView(viewModel: FriendsViewModel(api: FriendsAPI()))
    }
}

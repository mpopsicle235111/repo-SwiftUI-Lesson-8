//
//  PhotoCellView.swift
//  Swift-UI-Hometask-2.0
//
//  Created by Anton Lebedev on 31.05.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct PhotoCellView: View {
    
    var photoAPI: PhotoAPI
    @State private var photoPressed = false
    
    //Added for autolayout
    let index: Int?
    @Binding var selectedGridItem: Int?
    
    
    var body: some View {
       
        return GeometryReader { proxy in
            VStack {
                WebImage(url: URL(string: photoAPI.sizes.last?.url ?? "Beth-img"))
                    .resizable() // Resizable like SwiftUI.Image
                    // Supports ViewBuilder as well
                    .frame(width: proxy.size.width/2, height: proxy.size.height/2, alignment: .center)
                    .scaledToFill()
                Spacer().frame(height: 5)
                LikeButtonView()
                    .frame(width: proxy.size.width)
            }
            .aspectRatio(1, contentMode: .fill)
            .preference(key: HeightSelector.self, value: proxy.size.width)
            .anchorPreference(key: SelectedItemKey.self, value: .bounds) {
                index == self.selectedGridItem ? $0 : nil
            }
            .onTapGesture {
                withAnimation(.default) {
                    self.selectedGridItem = index
                }
            }
        }
    }
        
    
}

struct PhotoCellView_Previews: PreviewProvider {
    var photosAPI: PhotosAPI
    static var previews: some View {
        PhotosView(viewModel: PhotosViewModel(friend: FriendAPI.init(canAccessClosed: true, domain: "", city: nil, id: 0, photo100: "", lastName: "", photo50: "", trackCode: "", isClosed: false, firstName: ""), api: PhotosAPI()))
    }
}



//
//  ContentView.swift
//  Matched Geometry Effect
//
//  Created by Bilal Durnagöl on 22.09.2022.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    
    @State private var isProfileViewExpanded = true
    @Namespace private var profileAnimation
    @Namespace private var profileImageID
    @Namespace private var profileNameID
    @Namespace private var profileJobID
    
    var body: some View {
        VStack {
            if isProfileViewExpanded {
                expandedProfileView
            } else {
                collapsedProfileView
            }
            
            videoListView
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension ContentView {
    
    
    var collapsedProfileView: some View {
        HStack {
            profileImage
                .matchedGeometryEffect(id: profileImageID, in: profileAnimation)
                .frame(width: 60, height: 60)
            
            VStack(alignment: .leading) {
                
                Text("Bilal Durnagöl")
                    .matchedGeometryEffect(id: profileNameID, in: profileAnimation)
                    .font(.title.bold())
                
                Text("iOS Developer")
                    .matchedGeometryEffect(id: profileJobID, in: profileAnimation)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding()
    }
    
    var expandedProfileView: some View {
        VStack {
            profileImage
                .matchedGeometryEffect(id: profileImageID, in: profileAnimation)
                .frame(width: 130, height: 130)
            
            VStack {
                Text("Bilal Durnagöl")
                    .matchedGeometryEffect(id: profileNameID, in: profileAnimation)
                    .font(.title.bold())
                
                Text("iOS Developer")
                    .matchedGeometryEffect(id: profileJobID, in: profileAnimation)
                    .foregroundColor(.pink)
                
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
                    .padding()
            }
        }
    }
    
    var videoListView: some View {
        ScrollViewReader { proxy in
            List {
                ForEach(0..<50, id: \.self) { i in
                    Color.gray
                        .opacity(0.7)
                        .frame(height: 150)
                        .cornerRadius(10)
                        .overlay {
                            Circle()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.pink)
                                .overlay {
                                    Image(systemName: "play.fill")
                                        .foregroundColor(.white)
                                }
                        }
                }
            }
            .simultaneousGesture(DragGesture().onChanged({ value in
                withAnimation {
                    isProfileViewExpanded = value.translation.height > 0
                }
            }))
            .onAppear {
                UITableView.appearance().backgroundColor = UIColor.clear
            }
        }
    }
    
    var profileImage: some View {
        Image("profile_image")
            .resizable()
            .scaledToFill()
            .clipShape(Circle())
    }
    
}

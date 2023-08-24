//
//  HomeView.swift
//  CatsInUIKit
//
//  Created by Jon Chang on 8/23/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    @State var showData = false
    
    var body: some View {
        VStack {
            switch showData {
            case true:
                ScrollView {
                    Text("=^._.^= ∫")
                        .font(.largeTitle)
                    listView
                }
            case false:
                Button {
                    showData = true
                } label: {
                    Text("Press to show cats")
                }
            }
        }
        .onAppear {
            viewModel.getData()
        }
    }
    
    private var listView: some View {
        ForEach(viewModel.data) { cat in
            CellView(cat: cat)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

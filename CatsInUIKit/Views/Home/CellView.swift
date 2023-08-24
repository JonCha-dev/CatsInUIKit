//
//  CellView.swift
//  CatsInUIKit
//
//  Created by Jon Chang on 8/23/23.
//

import SwiftUI

struct CellView: View {
    @State var cat: Cat
    
    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: URL(string: cat.photo)) { photo in
                photo
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150)
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150)
            }
            .padding(.trailing)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(cat.name)
                    .bold()
                Text("**Breed:** \(cat.breed)")
                VStack(alignment: .leading, spacing: 5) {
                    Text("Address:")
                        .bold()
                    Text(cat.address)
                        .multilineTextAlignment(.leading)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(.black, lineWidth: 4)
        )
        .padding(.horizontal)
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(cat: Mock.mock)
    }
}

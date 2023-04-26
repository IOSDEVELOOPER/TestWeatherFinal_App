//
//  TabBar.swift
//  TestAppWeather_FAU
//
//  Created by Андрей Федоров on 25.04.2023.
//

import SwiftUI

struct TabBar: View {
    @Binding var seletedItem: String
    @EnvironmentObject var viewModel : MainTabViewModel
    //let ns = NetworkService()
    var body: some View {
        HStack{
            Spacer()
            Image(systemName: "house")
                .font(.system(size: 35))
                .foregroundColor(.white)
                .onTapGesture {
                    seletedItem = "Home"
                }
            Spacer()
            ZStack {
                Circle()
                    .foregroundColor(.yellow)
                    .frame(width: 95)
                Image(systemName: "cloud")
                    .font(.system(size: 50))
                    .foregroundColor(.white)
            }
            .offset(y:-32)
            .shadow(radius: 8)
            .onTapGesture {
                seletedItem = "Main"
            }
            Spacer()
            Image(systemName: "wallet.pass")
                .font(.system(size: 35))
                .foregroundColor(.white)
                .onTapGesture {
                    viewModel.getDataForWeek(city: viewModel.name)
                    seletedItem = "List"
                }
            Spacer()
            
        }
        .background(content: {
            RoundedRectangle(cornerRadius: 30)
                .frame(maxWidth: .infinity)
                .foregroundColor(.custom.tabBarColor)
        })
        .padding(.horizontal)
        
    }
}

//struct TabBar_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBar()
//    }
//}

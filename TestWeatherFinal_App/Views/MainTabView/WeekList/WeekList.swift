//
//  WeekList.swift
//  TestAppWeather_FAU
//
//  Created by Андрей Федоров on 26.04.2023.
//

import SwiftUI

struct WeekList: View {
   // @Binding var city: String
    @EnvironmentObject var viewModel : MainTabViewModel
    var body: some View {
        VStack{
            ScrollView{
                ForEach(viewModel.tempForWeek, id: \.self){ item in
                    Text(item.description)
                        .foregroundColor(.white)
                        .font(.system(size: 30))
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 1)
                        .foregroundColor(.white)
                }
            }.padding()
        }
    }
}

//struct WeekList_Previews: PreviewProvider {
//    static var previews: some View {
//        WeekList()
//    }
//}

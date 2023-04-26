//
//  WeatherNow.swift
//  TestAppWeather_FAU
//
//  Created by Андрей Федоров on 25.04.2023.
//

import SwiftUI

struct WeatherNow: View {
    @State var city: String = ""
    @State var textFieldEnabled = false
    @State var selectedItem = "Main"
    @EnvironmentObject var viewModel : MainTabViewModel
    var body: some View {
        ZStack {
            
            //MARK: - Custom Color from file: Extensions/Color
            Color.custom.backgroundColor.ignoresSafeArea()
            
            VStack{
                
                
                switch selectedItem{
                case "Main":
                    //MARK: - First Main View with two state
                    MainView(city: $city, textFieldEnabled: $textFieldEnabled)
                case "Home":
                    Text("Home")
                        .foregroundColor(.white)
                        .font(.system(size: 40))
                    
                case "List":
                    WeekList()
                default:
                    MainView(city: $city, textFieldEnabled: $textFieldEnabled)
                }
                
                Spacer()
                
                TabBar(seletedItem: $selectedItem)
                    .ignoresSafeArea()
                
            }
            .padding(.top)
            
        }.ignoresSafeArea(.keyboard)
    }
}

struct WeatherNow_Previews: PreviewProvider {
    static var previews: some View {
        WeatherNow()
    }
}

struct MainView: View {
    @Binding var city: String
    @Binding var textFieldEnabled : Bool
    @EnvironmentObject var viewModel : MainTabViewModel
    var body: some View {
        VStack{
            
            ZStack{
                if !textFieldEnabled{
                    VStack{
                        //MARK: - Name frop request
                        Text("\(viewModel.name)")
                            .foregroundColor(.white)
                            .font(.system(size: 40,design: .rounded))
                        
                        
                        //MARK: - temp from request
                        Text("\(viewModel.temperature)")
                            .foregroundColor(.white)
                            .font(.system(size: 30,design: .rounded))
                        
                        
                        //MARK: - Label depends on temp
                        switch viewModel.temperature{
                        case -20...0:
                            Text("Одевайтесь теплее")
                                .foregroundColor(.white)
                                .font(.system(size: 30,design: .rounded))
                        case 1...15:
                            Text("Комфортно")
                                .foregroundColor(.white)
                                .font(.system(size: 30,design: .rounded))
                        case 16...50:
                            Text("Жара")
                                .foregroundColor(.white)
                                .font(.system(size: 30,design: .rounded))
                        default:
                            Text("")
                        }
                    }
                }
                else{
                    VStack{
                        //MARK: - Name frop request
                        ZStack {
                            if city == ""{
                                Text("Enter your city")
                                    .foregroundColor(.white)
                                    .font(.system(size: 30,design: .rounded))
                            }
                            TextField("", text: $city).frame(width: 182)
                                .foregroundColor(.white)
                                .font(.system(size: 30,design: .rounded))
                            
                        }
                        
                        
                        //MARK: - temp from request
                        Text("\(viewModel.temperature)")
                            .foregroundColor(.white)
                            .font(.system(size: 30,design: .rounded))
                        
                        
                        //MARK: - Label depends on temp
                        switch viewModel.temperature{
                        case -20...0:
                            Text("Одевайтесь теплее")
                                .foregroundColor(.white)
                                .font(.system(size: 30,design: .rounded))
                        case 1...15:
                            Text("Комфортно")
                                .foregroundColor(.white)
                                .font(.system(size: 30,design: .rounded))
                        case 16...50:
                            Text("Жара")
                                .foregroundColor(.white)
                                .font(.system(size: 30,design: .rounded))
                        default:
                            Text("")
                        }
                    }
                }
            }
            
            Button(action: {
                textFieldEnabled.toggle()
                city = ""
                if textFieldEnabled == true{
                    viewModel.temperature = -273
                }else{
                    viewModel.getData()
                }
                
            }, label: {
                Text("Перейти в другой режим")
                    .foregroundColor(.white)
                    .background {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 220,height: 80)
                            .foregroundColor(.custom.tabBarColor)
                    }
            })
            .padding(.top,40)
            if textFieldEnabled{
                Button(action: {
                    viewModel.getDataForCity(city: city)
                    viewModel.name = city
                }, label: {
                    Text("Узнать погоду")
                        .foregroundColor(.white)
                        .background {
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 220,height: 80)
                                .foregroundColor(.custom.tabBarColor)
                        }
                })
                .padding(.top,80)
            }
        }.onAppear(perform: viewModel.getData )
    }
}

//
//  MainTabViewModel.swift
//  TestAppWeather_FAU
//
//  Created by Андрей Федоров on 25.04.2023.
//

import Foundation
//import Combine
import SwiftUI


class MainTabViewModel: ObservableObject{
    
    let coreDataManager = CoreDataManager()
    
    @Published var temperature: Int = 0
    @Published var name: String = ""
    @Published var tempForWeek: [Int] = []
    
    let networkService = NetworkService()
    
    
    //MARK: - get temperature now for current City
    func getData(){
        if coreDataManager.getDataFromCoreData() != []{
            let mass = coreDataManager.getDataFromCoreData().first
            self.name = mass?.city ?? ""
            self.temperature = Int(mass?.temperature ?? 0) - 273
        }else{
            networkService.getTemperature { temp, name in
                DispatchQueue.main.sync {
                    self.temperature = (temp - 273)
                    self.name = name
                }
                self.coreDataManager.saveCityAndTemp(city: name, temp: Int16(temp))
            }
        }
    }
    
    //MARK: - get temperatur now fot chosen city
    func getDataForCity(city: String){
        networkService.getTemperatureForCity(city: city) { temp in
            DispatchQueue.main.sync {
                self.temperature = temp - 273
            }
        }
    }
    
    
    //MARK: - get temperature for week (chosen or current city)
    func getDataForWeek(city: String){
        networkService.getTempForWeek(city: city) { tempForWeek in
            DispatchQueue.main.sync {
                self.tempForWeek = tempForWeek
            }
        }
    }
}

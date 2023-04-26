//
//  FileManager.swift
//  TestAppWeather_FAU
//
//  Created by Андрей Федоров on 26.04.2023.
//

import Foundation
import CoreData

class MyEntity: NSManagedObject{
    @NSManaged var stringProperty: String
    @NSManaged var integerProperty: Int
    @NSManaged var integerArrayProperty: [Int]
}

class MyEntityManager {

    let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func saveEntity(stringValue: String, intValue: Int, intArrayValue: [Int]) {
        let entity = MyEntity(context: context)
        entity.stringProperty = stringValue
        entity.integerProperty = intValue
        entity.integerArrayProperty = intArrayValue
        
        do {
            try context.save()
        } catch {
            print("Error saving entity: \(error.localizedDescription)")
        }
    }
    
    func loadEntities() -> [MyEntity] {
        let fetchRequest = MyEntity.fetchRequest()
        
        do {
            let entities = try context.fetch(fetchRequest) as [MyEntity]
            return entities
        } catch {
            print("Error loading entities: \(error.localizedDescription)")
            return []
        }
    }
}

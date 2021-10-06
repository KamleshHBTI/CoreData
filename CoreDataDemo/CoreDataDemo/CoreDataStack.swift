//
//  CoreDataStack.swift
//  CoreDataStack
//
//  Created by Kamlesh on 06/10/21.
//

import Foundation
import CoreData

class CoreDataStack: NSObject{
  static let moduleName = "CoreDataDemo"
  
  //MARK: NSManagedObjectModel
  lazy var managedobjectModel: NSManagedObjectModel = {
    let modelURL = Bundle.main.url(forResource: CoreDataStack.moduleName, withExtension: "momd")
    return NSManagedObjectModel(contentsOf: modelURL!)!
  }()
  
  
  //MARK: DocumentDirectory
  lazy var applicationDocumentDirectory: NSURL = {
    return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last! as NSURL
  }()
  
  
  
  //MARK: NSPersistentStoreCoordinator
  lazy var persistentStoreCordinator: NSPersistentStoreCoordinator = {
    let cordinator = NSPersistentStoreCoordinator(managedObjectModel: managedobjectModel)
    
    let persistentStoreURL = self.applicationDocumentDirectory.appendingPathComponent("\(CoreDataStack.moduleName).sqlite")
    
    do {
      try cordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: persistentStoreURL!, options: [NSMigratePersistentStoresAutomaticallyOption: true, NSInferMappingModelAutomaticallyOption: true])
      
    }catch{
      fatalError("Presistent store error \(error)")
    }
    
    return cordinator
  }()
  
  
  
  //MARK: NSManagedObjectContext
  lazy var managedObjectContext: NSManagedObjectContext = {
    let managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    managedObjectContext.persistentStoreCoordinator = self.persistentStoreCordinator
    return managedObjectContext
  }()
  
  
  
  
  //MARK: SaveContext
  func saveMainContext(){
    if managedObjectContext.hasChanges{
      do {
        try managedObjectContext.save()
      }catch{
        fatalError("error in saveMainContext ")
      }
    }
  }
  
}

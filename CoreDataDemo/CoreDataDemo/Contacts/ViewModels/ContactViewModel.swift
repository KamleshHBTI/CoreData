//
//  ContactViewModel.swift
//  ContactViewModel
//
//  Created by Kamlesh on 06/10/21.
//

import Foundation
import CoreData

class ContactViewModel{
  
  lazy var coreDataStack = CoreDataStack()
  var contacts = [Contact]()
  
  //MARK: getContacts
  func getContacts(){

  }
  
  //MARK: updateContact
  func updateContact(_ contact: Contact) -> Contact?{
    
    return nil
  }
  
  //MARK: removeContact
  func removeContact(_ contact: Contact){
    
  }
  
}

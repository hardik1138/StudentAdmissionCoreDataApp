import Foundation

import UIKit
import CoreData

class coreDataHandler{
    static let shared = coreDataHandler()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let manageObjContext : NSManagedObjectContext?
    
    private init(){
        manageObjContext = appDelegate.persistentContainer.viewContext
    }
    func save(){
        appDelegate.saveContext()
    }
    func insert(Spid: Int,Pwd : String, Name: String, Gender: String , Cls: String , Bdate: String , completion : @escaping () -> Void){
        let stud = Student(context: manageObjContext!)
        stud.spid = Int64(Spid)
        stud.password = Pwd
        stud.name = Name
        stud.gender = Gender
        stud.cls = Cls
        stud.bdate = Bdate
        save()
        completion()
    }
    func update(stud:Student, Name: String, Gender: String , Cls: String , Bdate: String, completion : @escaping () -> Void){
        stud.name = Name
        stud.gender = Gender
        stud.cls = Cls
        stud.bdate = Bdate
        save()
        completion()
    }
    func delete(stud: Student, completion : @escaping () -> Void){
        manageObjContext!.delete(stud)
        
        save()
        completion()
    }
    func fetch() -> [Student]{
        
        //with where selfstudy
        let fetchRequest:NSFetchRequest<Student> = Student.fetchRequest()
        do{
            let studArray = try manageObjContext?.fetch(fetchRequest)
            return studArray!
        }catch{
            print(error)
            return [Student]()
        }
    }
    func changePwd(stud:Student , pwd:String ,completion : @escaping (Bool) -> Void){
        stud.password = pwd
        save()
        completion(true)
    }
    func fetchClassWise(cls:String)->[Student]
      {
          var sdata = [Student]()
          
          
          let fetchReq:NSFetchRequest = Student.fetchRequest()
          let predict = NSPredicate(format: "cls contains %@", cls)
          fetchReq.predicate = predict
          
          do{
              sdata = try (manageObjContext?.fetch(fetchReq))!
              return sdata
          }
          catch{
              print("Error")
              return [Student]()
          }
      }
    
    func insertNotice( title : String ,dis : String , date : String , cls : String ,completion : @escaping () -> Void){
        
        let note = Notice(context: manageObjContext!)
        note.title = title
        note.dis = dis
        note.date = date
        note.cls = cls
        save()
        completion()
    }
    func updateNotice(note:Notice, title : String ,dis : String , date : String, completion : @escaping () -> Void){
        note.title = title
        note.dis = dis
        note.date = date
        save()
        completion()
    }
    func deleteNotice(note:Notice, completion : @escaping () -> Void){
        manageObjContext!.delete(note)
        
        save()
        completion()
    }
    func fetchNoticeClassWise(cls:String)->[Notice]
      {
          var sdata = [Notice]()
          print("in core \(cls)")
          let fetchReq:NSFetchRequest = Notice.fetchRequest()
          let predict = NSPredicate(format: "cls contains %@", cls)
          fetchReq.predicate = predict
          do{
              sdata = try (manageObjContext?.fetch(fetchReq))!
              return sdata
          }
          catch{
              print("Error")
              return [Notice]()
          }
      }
    func chkLogin(spid:Int, pwd : String)->Student
      {
    
          let fetchReq:NSFetchRequest = Student.fetchRequest()
          let predict = NSPredicate(format: "spid contains \(spid) AND password contains \(pwd)")
          fetchReq.predicate = predict
          do{
              let sarr = try (manageObjContext?.fetch(fetchReq))!
              return sarr[0]
          }
          catch{
              print("Error")
              return Student()
          }
      }
}

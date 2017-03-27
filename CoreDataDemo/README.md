## CoreDataDemo

#### Create your table with attributes.
![CoreDataPic](http://i.imgur.com/bzi38BX.png)

#### Create data
````swift
import CoreData

let appDelegate = UIApplication.shared.delegate as! AppDelegate
let context = appDelegate.persistentContainer.viewContext
let newValue = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
newValue.setValue(textField.text, forKey: "username")

do {
    try context.save()
} catch  {
    print("failed to save")
}

````

#### Fetch data
````swift
let appDelegate = UIApplication.shared.delegate as! AppDelegate
let context = appDelegate.persistentContainer.viewContext
let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
request.returnsObjectsAsFaults = false

do {
    let results = try context.fetch(request)
    for result in results as! [NSManagedObject] {
        if let username = result.value(forKey: "username") as? String {
            welcomeMessage.text = "Hello, \(username)!"
        }
    }
} catch  {
    print("request failed")
}
````

class TodoList {
    var taskList : Array<Task>
    init(){
        taskList = Array()
    }
    func addTask(title:String ,complete:Bool )  {
        self.taskList.append(Task(title: title, complete: complete))
      }
    func readTaskFromUser (){
        var userTaskName :String = ""
        print("Enter your new To-do task ✍🏻:")
        if let userStringInput = readLine(){
            userTaskName = userStringInput
            self.taskList.append(Task(title: userTaskName, complete: false))
            print("Your To-do task saved ✔️")
        }else{
            print("❌ you are not enter input correctly")
        }
      
    }
    func readTaskFromUserToUpdate (task : Task) -> Bool{
        var userTaskName :String = ""
        var isTaskUpdated :Bool
        print("------Please enter the following details to update a task:------")
        print("\n Enter the new name To-do task 🖋:")
        if let userStringInput = readLine(){
            userTaskName = userStringInput
            task.setTitle(title: userTaskName)
            isTaskUpdated = true
            print("Your To-do task Updated ✔️")
        }else{
            isTaskUpdated = false
            print("❌ you are not enter input correctly")
        }
        return isTaskUpdated
    }
    func listAllTasksWithIndex (){
        print("--------Your To-Do List---------")
        
        if(taskList.count > 0){
            taskList.forEach{task in print("Your To-do task is 🗒: \(task.getTitle())"+" Status: \(task.getComplete())")}
        }else{
            print("You don't have a To-do 😃")
        }
        print("---------------------------------")
      
    }
}

class Task{
    var  title : String = ""
    var  complete : Bool = false
    init(title:String,complete:Bool){
        self.title = title
        self.complete = complete
    }
    func getTitle() -> String {
        return self.title
      }
    func setTitle(title:String)  {
        self.title = title
      }
    func getComplete() -> Bool {
        return self.complete
      }
    func setComplete(complete:Bool)  {
        self.complete = complete
      }
    func markInCompleted() -> Bool {
        self.complete = false
        return self.complete
      }
    func markCompleted() -> Bool {
        self.complete = true
        return self.complete
      }
    func formattedStringOfTask()-> String{
        var comStatus : String?
        if complete == true {
            comStatus = "Completed"
        }else{
            comStatus = "NOT COMPLETED"
        }
        
        return """
                Task: \(title), Status: \(comStatus!)
                """
    }
}

let  todoList = TodoList()
var menuChoice :String = ""

print("""
      Welcome to in To-Do app ✋,
           choice what you option from the menu
      
                 1- Display your to-do list 🗒
                 2- Add new to-do item ➕
                 3- Remove to-do item 🗑
                 4- Edit to-do item ✅
                 0- Exit ❌
      """)
while(menuChoice != "0") {
    print("\n Enter your option choice from menu ⌨️:")
    if let  userStringInput = readLine(){
        menuChoice = userStringInput
        switch (menuChoice) {
                      case "1":
                       todoList.listAllTasksWithIndex();
                      case "2":
                          todoList.readTaskFromUser();
                      case "3":
                        print("section3")
                          break;
                      case "0":
                          break;

                      default:
                           print("please, Enter your menu choice 1,2,3,4, or 0  ⌨️:")
                  }
    }else{
        print("please, Enter your menu choice 1,2,3,4, or 0  ⌨️:")
    }
    
}

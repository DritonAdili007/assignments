import Foundation

protocol Command {
    func execute()
}

class CreateUserCommand: Command {
    private let userService: UserService
    
    init(userService: UserService) {
        self.userService = userService
    }
    
    func execute() {
        userService.createUser()
    }
}

class DeleteUserCommand: Command {
    private let userService: UserService
    
    init(userService: UserService) {
        self.userService = userService
    }
    
    func execute() {
        userService.deleteUser()
    }
}

class UserService {
    func createUser() {
        print("UserService: Creating a user.")
    }
    
    func deleteUser() {
        print("UserService: Deleting a user.")
    }
}

class UserController {
    private var onCreate: Command?
    private var onDelete: Command?
    
    func setOnCreate(command: Command) {
        onCreate = command
    }
    
    func setOnDelete(command: Command) {
        onDelete = command
    }
    
    func createUser() {
        print("UserController: Creating a user...")
        onCreate?.execute()
    }
    
    func deleteUser() {
        print("UserController: Deleting a user...")
        onDelete?.execute()
    }
}

let userService = UserService()
let userController = UserController()

let createUserCommand = CreateUserCommand(userService: userService)
let deleteUserCommand = DeleteUserCommand(userService: userService)

userController.setOnCreate(command: createUserCommand)
userController.setOnDelete(command: deleteUserCommand)

userController.createUser()
userController.deleteUser()

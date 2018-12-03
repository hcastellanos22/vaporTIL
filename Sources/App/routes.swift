import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }
    
    // 1 Register a new route at /api/acronyms that accepts a POST request and returns Future<Acronym>.
    
    router.post("api", "acronyms") { req -> Future<Acronym> in
        
        // 2 Decode JSON request into an acronym model.
        //This returns Future<Acronym>. flatMap to extract the acronym
        return try req.content.decode(Acronym.self)
            .flatMap(to: Acronym.self) { acronym in
                
                // 3 Save model using Fluent
                return acronym.save(on: req)
        }
    }
    
    //Route

    /* Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete) */
}

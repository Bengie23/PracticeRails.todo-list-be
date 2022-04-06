# README
## This is a practice project, the main idea is to implement some sort of chain of responsibility (CoR), for that I decided to create a classic TODOLIST backend app.

## I wanted to work on the CoR pattern without having to spend a lot of time building other things, so I create 2 entities
### User
This entity requires no explanation.
Does not have a REST endpoint but user entity exist.
All request must have a user reference, user id or user name must be provided.
### Item
I created 2 versions of controllers for entity Item. The idea is to compare the implementation between versions.
* V1
this is more of a classic implementation of a ruby controller (not interesting at all)
* V2
this is the controller that implements CoR pattern so its content must look completely different.

### CoR implementation
All of the CoR related files are in the todo-list-manager (couldn't find a better name)
It all starts with handler.rb and AbstractHandler.rb, on top of them we have all the handlers found in handlers folder.
Then we have the ChainableRequest which is the object I pass from handler to handler.


### Why CoR?
The idea behind this pattern in this case is to divide and conquer, so instead of having big chunks of code doing multiple things we have multiple handlers where every one of them performs one single and simple task, like : 
* Multiple ways to identify user
As it has been implemented already, we can identify user by id or name, both handlers work independently
* Might-stop handler vs No-Stop handlers
Depending on the need we may want to execute a handler and then continue with the chain or evaluate the situation, if something's wrong we can stop the process and return something specific.
* Edge cases
Every request might be different and as the application grows we might need to handle specific cases that over time might be complex to isolate, by creating a unique handler per unique requirements we can isolate logic that then can be used only when really required.

On top of that there are some functionaities we might easly add to the base repository, like:
* Count items per user
if we add a new handler we could update the count property of user entity right after every change
* Execute tasks before or after an specific action.
Since handlers are chained and in order we could play with the order of the handlers in order to achieve the wanted behavior.

### Review Code
For a better understanding, go to controllers v1 to look at the todo-controller that does not implement CoR.
Instead look at the v2 todo-controller if you want to look at the implementation of CoR pattern.

## What is missing?
Well, so fat the idea is to validate that the implementation CoR pattern is going well, from here we still need to 
 1. Make sure we have all the needed endpoints (delete?)
 2. Add builder pattern/methods for building handlers and request object in a more organized way
 3. Add more handlers as needed, for example the handler to update the total count of todo items per user.
 4. Hopefully one day, we can have UI.

## Tech details
* Ruby version
2.6
* System dependencies
MySql

* Database creation
rake exec db:create
* Database initialization
rake exec db:migrate

## Requests
* Get all Items
* Get single Item
* create Item

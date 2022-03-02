// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Struct {
    // waht you need to do? task?
    // completed ? true or false

    struct Todo {
        string task;
        bool completed;
    }

    Todo[] public todoList;

    function createTodo1(string memory _task) public {
        Todo memory todo = Todo(_task, false);
        todoList.push(todo); 
    }

    function createTodo2(string memory _task) public {
        Todo memory todo = Todo({task: _task, completed: false});
        todoList.push(todo);
    }

    function createTodo3(string memory _task) public {
        Todo memory todo;
        todo.task = _task;
        todo.completed = false;

        todoList.push(todo);
    }

    function getTodo(uint _index) public view returns (Todo memory) {
        return todoList[_index];
    }

    function getTodoDetail(uint _index) public view returns (string memory task, bool completed) {
        Todo storage todo = todoList[_index];
        return (todo.task, todo.completed);
    }

    function setTask(uint _index, string memory _task) public {
        Todo storage todo = todoList[_index];
        todo.task = _task;
    }

    function ToggleCompleted(uint _index) public {
        Todo storage todo = todoList[_index];
        todo.completed = !todo.completed;
    }
}
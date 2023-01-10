pragma solidity ^0.8.0;
// SPDX-License-Identifier: MIT

contract TodoList {
    // Define a mapping from task ID to task information
    mapping(uint => Task) public tasks;

    // Define a struct to hold information about a task
    struct Task {
        uint id;
        string description;
        bool completed;
    }

    // Keep track of the next task ID
    uint public nextTaskId;

    // Add a new task to the to-do list
    function addTask(string memory description) public {
        // Create a new task
        Task memory newTask;
        newTask.id = nextTaskId;
        newTask.description = description;
        newTask.completed = false;

        // Save the task to the mapping and increment the task ID
        tasks[nextTaskId] = newTask;
        nextTaskId++;
    }

    // Mark a task as completed
    function completeTask(uint taskId) public {
        // Get the task from the mapping
        Task memory task = tasks[taskId];

        // Mark the task as completed
        task.completed = true;

        // Save the updated task to the mapping
        tasks[taskId] = task;
    }

    // Remove a task from the to-do list
    function removeTask(uint taskId) public {
        // Delete the task from the mapping
        delete tasks[taskId];
    }
}

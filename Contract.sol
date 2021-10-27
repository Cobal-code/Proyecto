// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.6;

contract TaskCrud {
    
// Contrato inteligente para ingresar y validar el reconocimiento mediante la firma de la persona, nombre y ID
    struct Task {
        uint id;
        string name;
        string firma;
    }
    
    Task[] tasks;
    uint nextId; 
    
    function createTask(string memory _name, string memory _firma) public {
        tasks.push(Task(nextId, _name, _firma));
        nextId++;
    }
    
    
    function findIndex(uint _id) internal view returns (uint) {
        for (uint i = 0; i < tasks.length; i++) {
            if (tasks[i].id == _id) {                
                return i;
            }
        }
        revert("Task not found");
    }
    
    function updateTask(uint _id, string memory _name, string memory _firma) public {
        uint index =  findIndex(_id);
        tasks[index].name = _name;
        tasks[index].firma = _firma;
    }
    
    function readTask(uint _id) public view returns (uint, string memory, string memory) {
        uint index = findIndex(_id);
        return (tasks[index].id, tasks[index].name, tasks[index].firma);
    }
    
    function deleteTask(uint _id) public {
        uint index = findIndex(_id);
        delete tasks[index];
    }
    
}

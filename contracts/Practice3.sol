// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Hackathon {
    struct Project {
        string title;
        uint[] ratings;
    }
    
    Project[] projects;

    // TODO: add the findWinner function

    function newProject(string calldata _title) external {
        // creates a new project with a title and an empty ratings array
        projects.push(Project(_title, new uint[](0)));
    }

    function rate(uint _idx, uint _rating) external {
        // rates a project by its index
        projects[_idx].ratings.push(_rating);
    }
    function findWinner() external view returns(Project memory){
    Project memory topProject;
    uint highest = 0; // Initialize highest to 0
    for(uint i=0; i<projects.length; i++){
        uint average = 0; // Initialize average to 0
        for(uint j=0; j<projects[i].ratings.length; j++){
            average += projects[i].ratings[j];
        }
        if(projects[i].ratings.length > 0) {
            average = average / projects[i].ratings.length; // Calculate average
        }
        if(average >= highest){ // Use >= instead of >
            highest = average;
            topProject = projects[i];
        }
    }
    return topProject;
}

}


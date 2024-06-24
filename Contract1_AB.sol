// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventTicketingBlockchain {
    // Constants
    string public Name;
    string public Event;
    bool public EventTicketUsed;

    // Constructor to initialize the contract
    constructor() {
        Name = "";
        Event = "";
        EventTicketUsed = false;
    }

    // Sets the name of the event attendee
    function setName(string memory _name) public returns (bool) {
        Name = _name;
        return true;
    }

    // Sets the event name, with a check for the EventTicketUsed flag
    function setEvent(string memory _event) public returns (string memory) {
        if (EventTicketUsed) {
            return "Error: Ticket has already been used.";
        } else {
            Event = _event;
            return "Event set successfully.";
        }
    }

    // Sets the status of the event ticket usage
    function setEventTicketUsed(bool _eventTicketUsed) public returns (bool) {
        EventTicketUsed = _eventTicketUsed;
        return true;
    }

    // Gets the current information of the constants
    function getInfo() public view returns (string memory, string memory, bool) {
        return (Name, Event, EventTicketUsed);
    }
}

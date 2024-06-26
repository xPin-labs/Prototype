// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventTicketingBlockchain {
    // Struct to hold ticket information
    struct Ticket {
        string name;
        string eventName;
        bool eventTicketUsed;
        string hyperlink;
    }

    // Array to store all tickets
    Ticket[] public tickets;

    // Function to add a new ticket
    function addTicket(string memory _name, string memory _eventName, string memory _hyperlink) public returns (uint) {
        Ticket memory newTicket = Ticket({
            name: _name,
            eventName: _eventName,
            eventTicketUsed: false,
            hyperlink: _hyperlink
        });
        tickets.push(newTicket);
        return tickets.length - 1; // Return the index of the newly added ticket
    }

    // Function to set the name of an event attendee for a specific ticket
    function setName(uint _ticketIndex, string memory _name) public returns (bool) {
        require(_ticketIndex < tickets.length, "Ticket index out of range.");
        tickets[_ticketIndex].name = _name;
        return true;
    }

    // Function to set the event name for a specific ticket, with a check for eventTicketUsed flag
    function setEventName(uint _ticketIndex, string memory _eventName) public returns (string memory) {
        require(_ticketIndex < tickets.length, "Ticket index out of range.");
        if (tickets[_ticketIndex].eventTicketUsed) {
            return "Error: Ticket has already been used.";
        } else {
            tickets[_ticketIndex].eventName = _eventName;
            return "Event set successfully.";
        }
    }

    // Function to set the status of the event ticket usage for a specific ticket
    function setEventTicketUsed(uint _ticketIndex, bool _eventTicketUsed) public returns (bool) {
        require(_ticketIndex < tickets.length, "Ticket index out of range.");
        tickets[_ticketIndex].eventTicketUsed = _eventTicketUsed;
        return true;
    }

    // Function to set the hyperlink for a specific ticket
    function setHyperlink(uint _ticketIndex, string memory _hyperlink) public returns (bool) {
        require(_ticketIndex < tickets.length, "Ticket index out of range.");
        tickets[_ticketIndex].hyperlink = _hyperlink;
        return true;
    }

    // Function to get the current information of a specific ticket
    function getTicketInfo(uint _ticketIndex) public view returns (string memory, string memory, bool, string memory) {
        require(_ticketIndex < tickets.length, "Ticket index out of range.");
        Ticket memory ticket = tickets[_ticketIndex];
        return (ticket.name, ticket.eventName, ticket.eventTicketUsed, ticket.hyperlink);
    }
}

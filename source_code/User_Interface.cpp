#include "User_Interface.h"
#include <ncurses.h>

User_Interface::User_Interface()
{
    initscr();
}

User_Interface::~User_Interface()
{
    endwin();
}

void User_Interface::initWindow()
{
    printw("To exit, press ESC"); // print formatted output in window
    const std::string header = "F1 RACE SIM";
    const std::string credits = "- Nitish";
    mvprintw(0, COLS - header.length(), header.c_str());
    mvprintw(LINES - 1, COLS - credits.length(), credits.c_str());
    refresh();
}
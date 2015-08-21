#define _XOPEN_SOURCE_EXTENDED 1
#include <ncursesw/curses.h>
#include <ncursesw/term.h>
#include <ncursesw/panel.h>
#include <ncursesw/menu.h>
#include <ncursesw/form.h>
#include <unistd.h>
#include <locale.h>

/* This is an ncurses playground in C/C++ so that I could test exactly what
 * ncurses is and how it works */

static WINDOW* stdinit() {
	// initialize the screen
	WINDOW* stdscr=initscr();
	cbreak();
	noecho();
	nonl();
	intrflush(stdscr, FALSE);
	keypad(stdscr, TRUE);
	clear();
	return stdscr;
}

static void demo_diagonal(WINDOW* stdscr) {
	for(int i=0;i<20;i++) {
		//these are the same
		//mvaddch(i,i,'a');
		mvwaddch(stdscr,i,i,'a');
	}
	refresh();
	// wait until key press
	getch();
	endwin();
}

static void demo_get_width_height(WINDOW* stdscr) {
	int nh, nw;
	getmaxyx(stdscr,nh,nw);
	endwin();
	printf("nh is [%d]\n", nh);
	printf("nw is [%d]\n", nw);
}

static void demo_old(WINDOW* stdscr) {
	chtype c=0;
	int nh, nw;
	getmaxyx(stdscr,nh,nw);
	while(true) {
		for(int x=0;x<nw;x++) {
			for(int y=0;y<nh;y++) {
				mvwaddch(stdscr,y,x,c);
				c++;
			}
		}
		refresh();
		getch();
		break;
	}
        endwin();
}

int main(int argc,char** argv,char** envp) {
	//setlocale(LC_ALL,"");
	WINDOW* stdscr=stdinit();
	if(0)
		demo_diagonal(stdscr);
	if(0)
		demo_get_width_height(stdscr);
	if(1)
		demo_old(stdscr);
	return 0;
}

//============================================================================
// Name        : Homework_1.cpp
// Author      : 
// Version     :
// Copyright   : Your copyright notice
// Description : Hello World in C++, Ansi-style
//============================================================================

#include <iostream>
#include "MazeDomain4D.h"
#include "PGMParser.h"
#include "MazeDomain.h"
#include "MazeDomainContinuous.h"
#include "MazeDomain4DContinuous.h"
//#include "MazeDomain4D.h"
#include "AStar.cpp"
#include "RRT.cpp"
using namespace std;
#define DEBUG true
int main() {
	cout << "!!!Hello World!!!" << endl; // prints !!!Hello World!!!
	//MazeDomainContinuous* md = new MazeDomainContinuous(DEBUG);
	//MazeDomain4DContinuous* md = new MazeDomain4DContinuous(DEBUG);
	MazeDomainContinuous* md = new MazeDomainContinuous(DEBUG);
	pair<MazeNode*, MazeNode*> start_goal = md->get_start_goal();
	int start_s=clock();
	rtt_search(md, start_goal.first, start_goal.second);
	int stop_s=clock();
	cout << "time: " << double(stop_s-start_s)/double(CLOCKS_PER_SEC)*1000 << endl;
	//rtt_search(md, start_goal.first, start_goal.second);
	//a_star_search(md, start_goal.first, start_goal.second);




	return 0;
}

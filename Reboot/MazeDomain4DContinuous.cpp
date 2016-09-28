/*
 * MazeDomain4DContinuous.cpp
 *
 *  Created on: Jan 15, 2015
 *      Author: curranw
 */

#include "MazeDomain4DContinuous.h"
#include<iostream>
MazeDomain4DContinuous::MazeDomain4DContinuous(bool debug) {
	// TODO Auto-generated constructor stub

}
MazeNode4D* MazeDomain4DContinuous::get_random()
{
	MazeNode4D* n = new MazeNode4D();
	while(true)
	{
		double x = double(rand())/RAND_MAX * width;
		double y = double(rand())/RAND_MAX * height;
		double dx = rand() % 3;
		double dy = rand() % 3;
		map<pair<pair<double, double>, pair<double, double> >, MazeNode4D*>::iterator node_it = xy_to_node.find(make_pair(make_pair(floor(x), floor(y)),make_pair(dx,dy)));
		if(node_it != xy_to_node.end())
		{
			if(node_it->second->wall == false)
			{
				n->wall = false;
				n->x = x;
				n->y = y;
				break;
			}
		}
	}
	return n;
}

bool MazeDomain4DContinuous::is_valid(MazeNode4D* node)
{
	double x = node->x;
	double y = node->y;
	double dx = node->dx;
	double dy = node->dy;
	MazeNode4D* maze_node = xy_to_node.find(make_pair(make_pair(floor(x), floor(y)),make_pair(dx,dy)))->second;
	if(maze_node->wall == true) return false;
	return true;
}
void MazeDomain4DContinuous::set_solution(vector<MazeNode4D*> solution)
{
	for(vector<MazeNode4D*>::iterator it = solution.begin(); it != solution.end(); it++)
	{
		MazeNode4D* cur_node = *it;
		cout << cur_node->x << " ";
		cout << cur_node->y << " " << endl;
	}
	bool found;
	int i = 0;
	for(vector<MazeNode4D*>::iterator maze_it = maze.begin(); maze_it != maze.end(); maze_it++)
	{
		MazeNode4D* cur_maze = *maze_it;
		found = false;
		for(vector<MazeNode4D*>::iterator it = solution.begin(); it != solution.end(); it++)
		{
			MazeNode4D* cur_node = *it;
			if(floor(cur_node->x) == floor(cur_maze->x) && floor(cur_node->y) == floor(cur_maze->y))
			{
				cout << "X";
				found = true;
				break;
			}
		}
		if(!found) cout << cur_maze->wall;
		if(i++ == 24)
		{
			i = 0;
			cout << endl;
		}
	}
}

MazeDomain4DContinuous::~MazeDomain4DContinuous() {
	// TODO Auto-generated destructor stub
}


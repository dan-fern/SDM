/*
 * MazeDomainContinuous.cpp
 *
 *  Created on: Jan 14, 2015
 *      Author: curranw
 */

#include "MazeDomainContinuous.h"

MazeDomainContinuous::MazeDomainContinuous(bool debug) {
	// TODO Auto-generated constructor stub

}

MazeNode* MazeDomainContinuous::get_random()
{
	MazeNode* n = new MazeNode();
	while(true)
	{
		double x = double(rand())/RAND_MAX * width;
		double y = double(rand())/RAND_MAX * height;
		MazeNode* node = xy_to_node.find(make_pair(floor(x), floor(y)))->second;
		if(node->wall == false)
		{
			n->wall = false;
			n->x = x;
			n->y = y;
			break;
		}
	}
	return n;
}

bool MazeDomainContinuous::is_valid(MazeNode* node)
{
	double x = node->x;
	double y = node->y;
	MazeNode* maze_node = xy_to_node.find(make_pair(floor(x), floor(y)))->second;
	if(maze_node->wall == true) return false;
	return true;
}
void MazeDomainContinuous::set_solution(vector<MazeNode*> solution)
{
	for(vector<MazeNode*>::iterator it = solution.begin(); it != solution.end(); it++)
	{
		MazeNode* cur_node = *it;
		cout << cur_node->x << " ";
		cout << cur_node->y << " " << endl;
	}
	bool found;
	int i = 0;
	for(vector<MazeNode*>::iterator maze_it = maze.begin(); maze_it != maze.end(); maze_it++)
	{
		MazeNode* cur_maze = *maze_it;
		found = false;
		for(vector<MazeNode*>::iterator it = solution.begin(); it != solution.end(); it++)
		{
			MazeNode* cur_node = *it;
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

MazeDomainContinuous::~MazeDomainContinuous() {
	// TODO Auto-generated destructor stub
}


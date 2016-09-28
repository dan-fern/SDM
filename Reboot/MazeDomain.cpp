/*
 * MazeDomain.cpp
 *
 *  Created on: Jan 13, 2015
 *      Author: curranw
 */

#include "MazeDomain.h"
#include "PGMParser.h"
#include "Node.h"
#include <math.h>
MazeDomain::MazeDomain(bool debug): debug(debug) {
	debug = true;
	PGM_Parser* p = new PGM_Parser(debug);
	p->parse("/nfs/attic/smartw/users/curranw/Documents/Seq_dec_making/Homework_1/maze1.pgm");
	width = p->width;
	height = p->height;
	for(int i = 0; i < p->width; i++)
	{
		for(int j = 0; j < p->height; j++)
		{
			MazeNode* node = new MazeNode();
			node->x = i;
			node->y = j;
			if(p->image[i][j] == 0) node->wall = true;
			else node->wall = false;
			maze.push_back(node);
			//if(p->image[i][j] == 0) continue;
			xy_to_node.insert(make_pair(make_pair(i,j),node));
		}
	}
}

pair<MazeNode*, MazeNode*> MazeDomain::get_start_goal()
{
	MazeNode* start = xy_to_node.find(make_pair(0,0))->second;
	MazeNode* goal = xy_to_node.find(make_pair(width-1, height-1))->second;
	return make_pair(start, goal);
}

set<MazeNode*> MazeDomain::get_neighbors(MazeNode* n)
{
	set<MazeNode*> neighbors;
	if(n->x == 16 && n->y == 10)
	{
		cout << "HOWDIE";
	}
	for(int i = 0; i < 4; i++)
	{
		map<pair<int, int>, MazeNode*>::iterator neighbor_it;
		if(i == 0) neighbor_it = xy_to_node.find(make_pair(n->x+1, n->y));
		if(i == 1) neighbor_it = xy_to_node.find(make_pair(n->x, n->y+1));
		if(i == 2) neighbor_it = xy_to_node.find(make_pair(n->x-1, n->y));
		if(i == 3) neighbor_it = xy_to_node.find(make_pair(n->x, n->y-1));
		if(neighbor_it != xy_to_node.end() && neighbor_it->second->wall == false)
		{
			neighbors.insert(neighbor_it->second);
		}
	}
	return neighbors;
}
double MazeDomain::get_heuristic_score(MazeNode* n, MazeNode* goal)
{
	//double val = abs(n->x - goal->x) + abs(n->y - goal->y);
	//return val;
	double val = pow((n->x - goal->x),2) + pow((n->y - goal->y),2);
	//cout << val << endl;
	if(val == 0) return 0;
	double returnVal = sqrt(val)*10;
	if(returnVal > (abs(n->x - goal->x) + abs(n->y - goal->y) ))
	{
		cout << 'UH OH!';
	}

	return returnVal*10;
	//return (abs(n->x - goal->x) + abs(n->y - goal->y) )* 10;

}

double MazeDomain::get_cost_score(MazeNode* n, MazeNode* start)
{
	return abs(n->x - start->x) + abs(n->y - start->y);
}

double MazeDomain::cost_between(MazeNode* node_one, MazeNode* node_two)
{
	return abs(node_one->x - node_two->x) + abs(node_one->y - node_two->y);
}

vector<double> MazeDomain::dist_between(MazeNode* node_one, MazeNode* node_two)
{
	vector<double> states;
	states.push_back(node_two->x - node_one->x);
	states.push_back(node_two->y - node_one->y);
	return states;
}

MazeNode* MazeDomain::create_node(vector<double> states)
{
	MazeNode* node = new MazeNode();
	node->x = states[0];
	node->y = states[1];
	node->wall = false;
	return node;
}

bool MazeDomain::is_valid(MazeNode* node)
{
	if(node->wall == true) return false;
	return true;
}

bool MazeDomain::is_valid(MazeNode4D* node)
{
	if(node->wall == true) return false;
	return true;
}
void MazeDomain::set_solution(vector<MazeNode*> solution)
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
			if(cur_node->x == cur_maze->x && cur_node->y == cur_maze->y)
			{
				cout << "150" << " ";
				found = true;
				break;
			}
		}
		if(!found)
		{
			if(cur_maze->wall)
			{
				cout << "0" << "  ";
			}
			else
			{
				cout << "255" << " ";
			}
		}
		if(i++ == 24)
		{
			i = 0;
			cout << endl;
		}
	}
}

vector<double> MazeDomain::get_state(MazeNode* node)
{
	vector<double> state;
	state.push_back(node->x);
	state.push_back(node->y);
	return state;
}

MazeNode* MazeDomain::get_random()
{

}

MazeDomain::~MazeDomain() {
	// TODO Auto-generated destructor stub
}


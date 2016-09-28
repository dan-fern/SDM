/*
 * MazeDomain4D.cpp
 *
 *  Created on: Jan 13, 2015
 *      Author: curranw
 */

#include "MazeDomain4D.h"
#include "PGMParser.h"
#include "Node.h"
#include <math.h>
MazeDomain4D::MazeDomain4D(bool debug): debug(debug) {
	debug = true;
	PGM_Parser* p = new PGM_Parser(debug);
	p->parse("/nfs/attic/smartw/users/curranw/Documents/Seq_dec_making/Homework_1/maze2.pgm");
	width = p->width;
	height = p->height;
	for(int i = 0; i < p->width; i++)
	{
		for(int j = 0; j < p->height; j++)
		{
			for(int k = 0; k < 8; k++)
			{
				MazeNode4D* node = new MazeNode4D();
				node->x = i;
				node->y = j;
				if(k==0){
					node->dx = 0;
					node->dy = 0;
				}
				if(k==1){
					node->dx = 0;
					node->dy = 1;
				}
				if(k==2){
					node->dx = 0;
					node->dy = 2;
				}
				if(k==3){
					node->dx = 1;
					node->dy = 0;
				}
				if(k==4){
					node->dx = 1;
					node->dy = 2;
				}
				if(k==5){
					node->dx = 2;
					node->dy = 0;
				}
				if(k==6){
					node->dx = 2;
					node->dy = 1;
				}
				if(k==6){
					node->dx = 2;
					node->dy = 2;
				}

				if(i + node->dx >= width || j + node->dy >= height) continue;
				if(p->image[i][j] == 0 || p->image[i+node->dx][j+node->dy] == 0)
				{
					node->wall = true;
				}
				else node->wall = false;
				if(k==0) maze.push_back(node);
				//if(p->image[i][j] == 0) continue;
				xy_to_node.insert(make_pair(make_pair(make_pair(i,j),make_pair(node->dx, node->dy)),node));
			}
		}
	}
}

pair<MazeNode4D*, MazeNode4D*> MazeDomain4D::get_start_goal()
{
	MazeNode4D* start = xy_to_node.find(make_pair(make_pair(0,0),make_pair(0,0)))->second;
	MazeNode4D* goal = xy_to_node.find(make_pair(make_pair(width-1,height-1), make_pair(0,0)))->second;
	return make_pair(start, goal);
}

set<MazeNode4D*> MazeDomain4D::get_neighbors(MazeNode4D* n)
{
	set<MazeNode4D*> neighbors;
	double cur_vel_x = n->dx;
	double cur_vel_y = n->dy;
	double cur_x = n->x + cur_vel_x;
	double cur_y = n->y + cur_vel_y;

	for(int i = 0; i < 5; i++)
	{
		map<pair<pair<double, double>, pair<double, double> >, MazeNode4D*>::iterator neighbor_it;
		if(i == 0) neighbor_it = xy_to_node.find(make_pair(make_pair(cur_x,cur_y), make_pair(cur_vel_x-1,cur_vel_y)));
		if(i == 1) neighbor_it = xy_to_node.find(make_pair(make_pair(cur_x,cur_y), make_pair(cur_vel_x+1,cur_vel_y)));
		if(i == 2) neighbor_it = xy_to_node.find(make_pair(make_pair(cur_x,cur_y), make_pair(cur_vel_x,cur_vel_y-1)));
		if(i == 3) neighbor_it = xy_to_node.find(make_pair(make_pair(cur_x,cur_y), make_pair(cur_vel_x,cur_vel_y+1)));
		if(i == 4) neighbor_it = xy_to_node.find(make_pair(make_pair(cur_x,cur_y), make_pair(cur_vel_x,cur_vel_y)));
		if(neighbor_it != xy_to_node.end() && neighbor_it->second->wall == false)
		{
			neighbors.insert(neighbor_it->second);
		}
	}
	return neighbors;
}
double MazeDomain4D::get_heuristic_score(MazeNode4D* n, MazeNode4D* goal)
{
	//double val = pow((n->x - goal->x),2) + pow((n->y - goal->y),2);
	//if(val == 0) return 0;
	//else return sqrt(val)*10;
	return (abs(n->x - goal->x) + abs(n->y - goal->y) ) * 10;
}

double MazeDomain4D::get_cost_score(MazeNode4D* n, MazeNode4D* start)
{
	return abs(n->x - start->x) + abs(n->y - start->y);
}

double MazeDomain4D::cost_between(MazeNode4D* node_one, MazeNode4D* node_two)
{
	return abs(node_one->x - node_two->x) + abs(node_one->y - node_two->y);
}

vector<double> MazeDomain4D::dist_between(MazeNode4D* node_one, MazeNode4D* node_two)
{
	vector<double> states;
	states.push_back(node_two->x - node_one->x);
	states.push_back(node_two->y - node_one->y);
	return states;
}

MazeNode4D* MazeDomain4D::create_node(vector<double> states)
{
	MazeNode4D* node = new MazeNode4D();
	node->x = states[0];
	node->y = states[1];
	node->wall = false;
	return node;
}

bool MazeDomain4D::is_valid(MazeNode4D* node)
{
	if(node->wall == true) return false;
	return true;
}

bool MazeDomain4D::is_valid(MazeNode4D4D* node)
{
	if(node->wall == true) return false;
	return true;
}
void MazeDomain4D::set_solution(vector<MazeNode4D*> solution)
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

vector<double> MazeDomain4D::get_state(MazeNode4D* node)
{
	vector<double> state;
	state.push_back(node->x);
	state.push_back(node->y);
	return state;
}

MazeNode4D* MazeDomain4D::get_random()
{

}

MazeDomain4D::~MazeDomain4D() {
	// TODO Auto-generated destructor stub
}


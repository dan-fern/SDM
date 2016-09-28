/*
 * RRT.cpp
 *
 *  Created on: Jan 14, 2015
 *      Author: curranw
 */

#include "IDomain.h"
#include <vector>
#include <set>
#include <queue>
#include <map>
#include <limits>
#include <iostream>

template<class NODE>
class TreeElement
{
public:
	TreeElement<NODE>* parent;
	NODE* vertex;

	TreeElement()
	{
		parent = 0;
		vertex = 0;
	}
};

template<class NODE>
static void rtt_search(IDomain<NODE*>* d, NODE* start, NODE* goal)
{
	vector<TreeElement<NODE>* > t;
	double delta_change = 0.1;
	TreeElement<NODE>* t_start = new TreeElement<NODE>();
	t_start->vertex = start;
	t.push_back(t_start);
	TreeElement<NODE>* t_goal = new TreeElement<NODE>();
	bool goal_found = false;

	while(!goal_found)
	{
		NODE* random_node = d->get_random();
		//Nearest Vertex
		double nearest_distance = numeric_limits<double>::max();
		TreeElement<NODE>* nearest_node;
		for(typename vector<TreeElement<NODE>* >::iterator  it = t.begin(); it != t.end(); it++)
		{
			TreeElement<NODE>* ele = *it;
			double distance = d->cost_between(random_node, ele->vertex);
			if(distance < nearest_distance)
			{
				nearest_node = ele;
				nearest_distance = distance;
			}
		}

		//Move incrementally from random_node to nearest_vertex
		TreeElement<NODE>* new_tree_ele = new TreeElement<NODE>();
		new_tree_ele->parent = nearest_node;
		vector<double> states_diff = d->dist_between(nearest_node->vertex, random_node);
		vector<double> cur_state = d->get_state(nearest_node->vertex);
		for(unsigned int i = 0; i < states_diff.size(); i++)
		{
			states_diff[i] = cur_state[i] + (states_diff[i] * delta_change);
		}
		NODE* new_node = d->create_node(states_diff);
		cout << "New Node!" << endl;
		cout << states_diff[0] << " " << states_diff[1] << endl;

		if(d->is_valid(new_node))
		{
			new_tree_ele->vertex = new_node;
		}
		else
		{
			delete new_node;
			continue;
		}

		//Add vertex to tree
		t.push_back(new_tree_ele);

		//Check for goal.
		vector<double> dist_between = d->dist_between(new_node, goal);
		goal_found = true;
		for(unsigned int i = 0; i < dist_between.size(); i++)
		{
			if(dist_between[i] > 1)
			{
				goal_found = false;
				break;
			}
		}
		if(goal_found) t_goal = new_tree_ele;
	}

	//Build solution
	vector<NODE*> path;
	while(t_goal->parent != 0)
	{
		path.push_back(t_goal->vertex);
		t_goal = t_goal->parent;
	}
	d->set_solution(path);
}




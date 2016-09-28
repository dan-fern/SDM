/*
 * AStar.cpp
 *
 *  Created on: Jan 13, 2015
 *      Author: curranw
 */

//#include "AStar.h"

#include "IDomain.h"
#include <vector>
#include <set>
#include <queue>
#include <map>
#include <limits>
#include<iostream>
#include <algorithm>

struct dereference_compare
{
    template <typename NODE>
    bool operator()(const NODE* pX, const NODE* pY) const
    {
    	return pX->score < pY->score;
    }
};

template<class NODE>
static void a_star_search(IDomain<NODE*>* d, NODE* start, NODE* goal)
{
	set<NODE*> closed_set;
	vector<NODE*> open_set;


	map<NODE*, double> node_to_cost;
	map<NODE*, NODE*> solution;
	open_set.push_back(start);
	start->score = 0 + d->get_heuristic_score(start, goal);
	node_to_cost.insert(make_pair(start, 0));

	while(!open_set.empty())
	{
		std::sort(open_set.begin(), open_set.end(), dereference_compare());
		cout << open_set.size() << endl;
		NODE* cur_node = *open_set.begin();
		open_set.erase(open_set.begin());
		cout << open_set.size() << endl;
		if(cur_node == goal)
		{
			vector<NODE*> path;
			path.push_back(cur_node);
			while(solution.find(cur_node) != solution.end())
			{
				cur_node = solution[cur_node];
				path.push_back(cur_node);
			}
			d->set_solution(path);
			cout << "Expanded Nodes: " << closed_set.size() << endl;
			cout << "Path Length: " << path.size() << endl;
			return;
		}
		closed_set.insert(cur_node);
		set<NODE*> cur_node_neighbors = d->get_neighbors(cur_node);

		for(typename set<NODE*>::iterator neighbor_it = cur_node_neighbors.begin(); neighbor_it != cur_node_neighbors.end(); neighbor_it++)
		{
			NODE* neighbor_node = *neighbor_it;

			//If node has never been seen, give it the max cost.
			if(node_to_cost.find(neighbor_node) == node_to_cost.end()) node_to_cost.insert(make_pair(neighbor_node, numeric_limits<double>::max()));

			if(closed_set.find(neighbor_node) != closed_set.end())
			{
				continue;
			}
			double temp_g_score = d->get_cost_score(cur_node, start) + d->cost_between(cur_node, neighbor_node);

			if(std::find(open_set.begin(), open_set.end(), neighbor_node) == open_set.end() || temp_g_score < node_to_cost[neighbor_node])
			{
				typename map<NODE*,NODE*>::iterator it = solution.find(neighbor_node);
				if(it == solution.end())
				{
					solution.insert(make_pair(neighbor_node, cur_node));
				}
				else
				{
					solution.erase(it);
					solution.insert(make_pair(neighbor_node, cur_node));
				}
				node_to_cost[neighbor_node] = temp_g_score;
				neighbor_node->score = temp_g_score + d->get_heuristic_score(neighbor_node, goal);

				//cout << open_set.size() << endl;
				if(std::find(open_set.begin(), open_set.end(), neighbor_node) == open_set.end())
				{
					open_set.push_back(neighbor_node);
				}
			}
		}
	}
}




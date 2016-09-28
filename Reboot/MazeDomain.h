/*
 * MazeDomain.h
 *
 *  Created on: Jan 13, 2015
 *      Author: curranw
 */

#ifndef MAZEDOMAIN_H_
#define MAZEDOMAIN_H_

#include "Node.h"
#include "IDomain.h"
#include <vector>
#include <map>
#include <stdlib.h>

using namespace std;
struct MazeNode : Node{
	double x,y;
	bool wall;

	friend bool operator<(MazeNode const& me, MazeNode const& other)
    {
        return me.score < other.score;
    }
};

struct MazeNode4D : MazeNode{
	double x,y,dx,dy;
	bool wall;
};
class MazeDomain : public IDomain<MazeNode*>{
public:
	MazeDomain(bool debug=true);
	pair<MazeNode*, MazeNode*> get_start_goal();
	set<MazeNode*> get_neighbors(MazeNode* n);
	double get_heuristic_score(MazeNode* n, MazeNode* goal);
	double get_cost_score(MazeNode* n, MazeNode* start);
	double cost_between(MazeNode* node_one, MazeNode* node_two);
	void set_solution(vector<MazeNode*> solution);
	MazeNode* get_random();
	vector<double> dist_between(MazeNode* node_one, MazeNode* node_two);
	MazeNode* create_node(vector<double> states);
	bool is_valid(MazeNode* node);
	bool is_valid(MazeNode4D* node);
	vector<double> get_state(MazeNode* node);
	virtual ~MazeDomain();

	bool debug;
	vector<MazeNode*> maze;
	map<pair<int, int>, MazeNode*> xy_to_node;
	vector<MazeNode*> solution;
	double width,height;
};

//template class IDomain<MazeNode>;
//template class IDomain<MazeNode>;
#endif /* MAZEDOMAIN_H_ */

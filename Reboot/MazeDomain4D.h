/*
 * MazeDomain4D.h
 *
 *  Created on: Jan 13, 2015
 *      Author: curranw
 */

#ifndef MazeDomain4D_H_
#define MazeDomain4D_H_

#include "MazeDomain.h"
#include "IDomain.h"
#include <vector>
#include <map>
#include <stdlib.h>

using namespace std;

struct MazeNode4D4D : MazeNode4D{
	double dx,dy;
	bool wall;
};
class MazeDomain4D : public IDomain<MazeNode4D*>{
public:
	MazeDomain4D(bool debug=true);
	pair<MazeNode4D*, MazeNode4D*> get_start_goal();
	set<MazeNode4D*> get_neighbors(MazeNode4D* n);
	double get_heuristic_score(MazeNode4D* n, MazeNode4D* goal);
	double get_cost_score(MazeNode4D* n, MazeNode4D* start);
	double cost_between(MazeNode4D* node_one, MazeNode4D* node_two);
	void set_solution(vector<MazeNode4D*> solution);
	MazeNode4D* get_random();
	vector<double> dist_between(MazeNode4D* node_one, MazeNode4D* node_two);
	MazeNode4D* create_node(vector<double> states);
	bool is_valid(MazeNode4D* node);
	bool is_valid(MazeNode4D4D* node);
	vector<double> get_state(MazeNode4D* node);
	virtual ~MazeDomain4D();

	bool debug;
	vector<MazeNode4D*> maze;
	map<pair<pair<double, double>, pair<double, double> >, MazeNode4D*> xy_to_node;
	vector<MazeNode4D*> solution;
	double width,height;
};

//template class IDomain<MazeNode4D>;
//template class IDomain<MazeNode4D>;
#endif /* MazeDomain4D_H_ */

/*
 * IDomain.h
 *
 *  Created on: Jan 14, 2015
 *      Author: curranw
 */

#ifndef IDOMAIN_H_
#define IDOMAIN_H_

#include <set>
#include <vector>
#include "Node.h"

using namespace std;
template <class T>
class IDomain {
public:
	virtual set<T> get_neighbors(T n) = 0;
	virtual double get_heuristic_score(T n, T goal) = 0;
	virtual double get_cost_score(T n, T start) = 0;
	virtual double cost_between(T node_one, T node_two) = 0;
	virtual void set_solution(vector<T> solution) = 0;
	virtual T get_random() = 0;
	virtual vector<double> dist_between(T node_one, T node_two) = 0;
	virtual T create_node(vector<double> states) = 0;
	virtual bool is_valid(T node) = 0;
	virtual vector<double> get_state(T node) = 0;
	virtual ~IDomain() {};
};


#endif /* IDOMAIN_H_ */

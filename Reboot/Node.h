/*
 * Node.h
 *
 *  Created on: Jan 13, 2015
 *      Author: curranw
 */

#ifndef NODE_H_
#define NODE_H_

#include <set>

using namespace std;
class Node
{
public:
	//Node();
	//set<Node> get_neighbors();
	//void set_neighbors();

	virtual ~Node();


	unsigned int node_num;
	//set<Node> neighbors;
	double score;

	friend bool operator<(Node const& me, Node const& other)
    {
        return me.score < other.score;
    }

};


#endif /* NODE_H_ */

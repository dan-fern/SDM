/*
 * MazeDomain4DContinuous.h
 *
 *  Created on: Jan 15, 2015
 *      Author: curranw
 */

#ifndef MAZEDOMAIN4DCONTINUOUS_H_
#define MAZEDOMAIN4DCONTINUOUS_H_

#include "MazeDomain4D.h"
#include <math.h>

using namespace std;
class MazeDomain4DContinuous : public MazeDomain4D{

public:
	MazeDomain4DContinuous(bool debug);
	MazeNode4D* get_random();
	bool is_valid(MazeNode4D* node);
	void set_solution(vector<MazeNode4D*> solution);
	virtual ~MazeDomain4DContinuous();
};

#endif /* MAZEDOMAIN4DCONTINUOUS_H_ */

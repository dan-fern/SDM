/*
 * MazeDomainContinuous.h
 *
 *  Created on: Jan 14, 2015
 *      Author: curranw
 */

#ifndef MAZEDOMAINCONTINUOUS_H_
#define MAZEDOMAINCONTINUOUS_H_

#include "MazeDomain.h"
#include <math.h>
#include<iostream>
using namespace std;
class MazeDomainContinuous : public MazeDomain {
public:
	MazeDomainContinuous(bool debug);
	MazeNode* get_random();
	bool is_valid(MazeNode* node);
	void set_solution(vector<MazeNode*> solution);
	virtual ~MazeDomainContinuous();
};

#endif /* MAZEDOMAINCONTINUOUS_H_ */

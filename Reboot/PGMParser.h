/*
 * PGMParser.h
 *
 *  Created on: Jan 13, 2015
 *      Author: curranw
 */

#ifndef PGMPARSER_H_
#define PGMPARSER_H_
#include <fstream>
#include <vector>
#include <iostream>
#include <sstream>
using namespace std;
class PGM_Parser {
public:
	PGM_Parser(bool debug);
	void parse(string filename);
	virtual ~PGM_Parser();

	bool debug;
	vector<vector<int> > image;
	int width, height;
};

#endif /* PGMPARSER_H_ */

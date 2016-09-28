/*
 * PGMParser.cpp
 *
 *  Created on: Jan 13, 2015
 *      Author: curranw
 */

#include "PGMParser.h"

PGM_Parser::PGM_Parser(bool debug) : debug(debug){
	// TODO Auto-generated constructor stub

}

void PGM_Parser::parse(string filename)
{
	ifstream file;
	file.open(filename.c_str());
	string line;
	stringstream ss;
	for(unsigned int i = 0; i < 4; i++)
	{
		getline(file,line);
		if(i == 2)
		{
			ss.str(line);
			ss >> width;
			ss >> height;
		}
	}
	if(debug)
	{
		cout << width << endl;
		cout << height << endl;
	}
	ss.str("");
	ss.clear();
	vector<int> row;
	getline(file,line);
	ss.str(line);

	//for(unsigned int j = 0; j < height; j++)
	int i = 0;
	while(true)
	{
		/*
		while(true)
		{
			val = 0;
			ss >> val;
			if(ss.eof()) break;
			if(val != 0) val = 1;
			row.push_back(val);
			if(row.size() == width)
			{
				image.push_back(row);
				row.clear();
			}
		}
		*/
		if(line[i++] == 0) row.push_back(0);
		else row.push_back(1);

		if(row.size() == width)
		{
			image.push_back(row);
			row.clear();
		}

		if(image.size() == height) break;
	}

	if(debug)
	{
		for(int i = 0; i < width; i++)
		{
			for(int j = 0; j < height; j++)
			{
				cout << image[i][j];
			}
			cout << endl;
		}
	}
	file.close();
}
PGM_Parser::~PGM_Parser() {
	// TODO Auto-generated destructor stub
}


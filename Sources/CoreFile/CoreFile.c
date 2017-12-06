#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "CoreFile.h"

char* CGetString(FILE *file){
	char line[12000];

	rewind(file);

	if (fgets(line, 12000, file) != NULL) {
		return line;
	}

	return "";
}
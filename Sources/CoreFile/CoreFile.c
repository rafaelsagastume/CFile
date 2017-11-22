#include <stdio.h>
#include <string.h>
#include "CoreFile.h"

FILE *CPointerFile() {
	FILE *file_aux;
	return file_aux;
}


FILE *CFileOpen(const char *filename, const char *mode) {
	return fopen(filename, mode);
}
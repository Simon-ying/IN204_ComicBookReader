#pragma once
#include <string>
#include <opencv2/opencv.hpp>
#include <map>
#include <vector>
extern "C"
{
#include "unarr.h"

#include <stdio.h>
#include <inttypes.h>
#include <string.h>
#if !defined(NDEBUG) && defined(_MSC_VER)
#include <windows.h>
#include <crtdbg.h>
#endif
}

class archiveManager
{
public:
    archiveManager() {};
    ~archiveManager() {};
	bool loadArchivedFiles(std::string file_path);
	bool loadOneImage(int num, cv::Mat &a_image);
	int getPageNumTotal();
private:
	ar_archive * ar_open_any_archive(ar_stream *stream, const char *fileext);
	std::string archive_path;
	ar_stream *stream = NULL;
	ar_archive *ar = NULL;

	std::vector<unsigned char> read_buffer;
	std::vector<size_t> offset_cache;
	int page_num_total;
	bool isSingleImg;
};


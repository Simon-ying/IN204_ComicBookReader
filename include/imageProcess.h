#pragma once
#include <string>
#include <map>
#include <opencv2/opencv.hpp>
#include <vector>
#include "archiveManager.h"
class ImageProcess{
public:
	ImageProcess(){ 
		is_loaded = false;
	}
    bool autoAdjustImage(cv::Mat& input_image, cv::Mat& output_image, int image_type_flag);


    bool autoAdjustImageText(cv::Mat& input_image, cv::Mat& output_image);
    bool autoAdjustImageGraphic(cv::Mat& input_image, cv::Mat& output_image);

    bool loadArchive(std::string path);

    bool getImage(int num, int image_type_flag, cv::Mat& output_image);
    int getPageNumTotal();
private:
    archiveManager archive_reader;
    int page_num_total;
    bool is_loaded;
};

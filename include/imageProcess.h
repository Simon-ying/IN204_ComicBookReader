#pragma once
#include "comicReader.h"
#include "archiveManager.h"
class ImageProcess:public ImageProcessInterface {
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

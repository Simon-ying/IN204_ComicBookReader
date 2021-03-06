#ifndef CACHE_H
#define CACHE_H

#include <mutex>
#include <thread>
#include <condition_variable>
#include <QSharedData>
#include <QCache>
#include <QImage>
#include <QReadWriteLock>
#include <QMetaType>
#include <opencv2/opencv.hpp>

class ImageData
{
public:
    int page_type;
    cv::Mat *cv_image_ptr;

	ImageData() {
		cv_image_ptr = new cv::Mat;
	}
	~ImageData(){
		delete cv_image_ptr;
	}
};

class PreloadParams
{

public:
    int page_num_current;
    int page_preload_left_size; //How much images should be preloaded in the left of page_num_current
    int page_preload_right_size;
    int page_type;

    PreloadParams(int t1, int t2, int t3, int t4){
        page_num_current = t1;
        page_preload_left_size = t2;
        page_preload_right_size = t3;
        page_type = t4;
    }
    PreloadParams(){
        page_num_current = 0;
        page_preload_left_size = 0;
        page_preload_right_size = 0;
        page_type = 0;
    }
};
Q_DECLARE_METATYPE(PreloadParams)

extern QCache<int,ImageData> cache;
extern QReadWriteLock cache_lock;



#endif // CACHE_H

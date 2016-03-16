//
//  ViewController.m
//  testProject
//
//  Created by RD on 3/16/16.
//  Copyright © 2016 XtremeApp. All rights reserved.
//


#import "ViewController.h"
#import <opencv2/opencv.hpp>
#import <opencv2/imgcodecs/ios.h>

@interface ViewController ()
{
    cv::Mat cvImage;
}
@end





@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    CGRect rect = [UIScreen mainScreen].bounds;
    
    self.mainImageview.frame = rect;
    
    
    UIImage *img = [UIImage imageNamed:@"test.JPG"];
    
    UIImageToMat(img, cvImage);
    
    if(!cvImage.empty())
    {
        cv::Mat gray;
        
        cv::cvtColor(cvImage, gray, CV_RGB2GRAY);
        cv::GaussianBlur(gray, gray, cv::Size(5,5), 1.2,1.2);
        cv::Mat edges;
        cv::Canny(gray, edges, 0, 60);
        cvImage.setTo(cv::Scalar(0,128,255,255),edges);
        
        self.mainImageview.image = MatToUIImage(cvImage);
        
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

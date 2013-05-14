//
//  KLViewController.m
//  DemoCoreImage
//
//  Created by Kyle Lopez on 5/13/13.
//  Copyright (c) 2013 Kyle Lopez. All rights reserved.
//

#import "KLViewController.h"
#import "SingletonCIContext.h"
#import <CoreImage/CoreImage.h>

@interface KLViewController () {
    BOOL toggle;
    
    CIContext *context;
}
@end

@implementation KLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    toggle = NO;
    
    context = [SingletonCIContext context];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)blurSun:(id)sender {
    toggle = !toggle;
    if(toggle) {
        UIImage *temp = [UIImage imageNamed:@"Sun.jpg"];
        CIImage *image = [CIImage imageWithCGImage:temp.CGImage];
        
        NSLog(@"%@",temp);
        
        CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur" keysAndValues:@"inputImage",image,@"inputRadius",@5.0F,nil];
        
        image = filter.outputImage;
        
        CGImageRef cgImage = [context createCGImage:image fromRect:[image extent]];
        
        UIImage *uiImage = [UIImage imageWithCGImage:cgImage];
        
        self.sunImage.image = uiImage;
        
        CGImageRelease(cgImage);
    }
    else
    {
        self.sunImage.image = [UIImage imageNamed:@"Sun.jpg"];
    }
}
@end

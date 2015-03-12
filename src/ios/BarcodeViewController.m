//
//  BarcodeViewController.m
//  AyalBarcodeReader
//
//  Created by Ayal Herath on 3/10/15.
//  Copyright (c) 2015 Ayal Herath. All rights reserved.
//

#import "BarcodeViewController.h"

@interface BarcodeViewController ()

@end

@implementation BarcodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _barcode = [[UIView alloc] init];
    _barcode.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleBottomMargin;
    _barcode.layer.borderColor = [UIColor greenColor].CGColor;
    _barcode.layer.borderWidth = 3;
    _scanner = [[MTBBarcodeScanner alloc] initWithPreviewView:self.view];

    [MTBBarcodeScanner requestCameraPermissionWithSuccess:^(BOOL success) {
        if (success)
        {
            [self.scanner startScanningWithResultBlock:^(NSArray *codes) {
                AVMetadataMachineReadableCodeObject *code = [codes firstObject];
                NSLog(@"Found code: %@", code.stringValue);
                _barcodeNumber = code.stringValue;
                [_scanner stopScanning];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"BarcodeRecived" object:nil];
            }];
        }
        else
        {
            // The user denied access to the camera
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)cancelBarcodeReading:(id)sender
{
    [_scanner stopScanning];
    //[[NSNotificationCenter defaultCenter] postNotificationName:@"BarcodeRecived" object:nil];
    //[self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)switchOnLight:(id)sender
{
    Class captureDeviceClass = NSClassFromString(@"AVCaptureDevice");
    if (captureDeviceClass != nil)
    {
        AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        if ([device hasTorch] && [device hasFlash]){
            
            [device lockForConfiguration:nil];
            if (!_isLightOn) {
                [device setTorchMode:AVCaptureTorchModeOn];
                [device setFlashMode:AVCaptureFlashModeOn];
                _isLightOn=YES;
            } else {
                [device setTorchMode:AVCaptureTorchModeOff];
                [device setFlashMode:AVCaptureFlashModeOff];
                _isLightOn=NO;
            }
            [device unlockForConfiguration];
        }
    }
}

@end

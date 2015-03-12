//
//  BarcodeViewController.h
//  AyalBarcodeReader
//
//  Created by Ayal Herath on 3/10/15.
//  Copyright (c) 2015 Ayal Herath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTBBarcodeScanner.h"

@interface BarcodeViewController : UIViewController

@property(nonatomic,strong) MTBBarcodeScanner *scanner;

@property(nonatomic,strong) UIView* barcode;

@property(nonatomic,strong) NSString *barcodeNumber;

@property(nonatomic,assign) BOOL isLightOn;

- (IBAction)cancelBarcodeReading:(id)sender;

- (IBAction)switchOnLight:(id)sender;

@end

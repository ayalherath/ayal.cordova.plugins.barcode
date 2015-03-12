//
//  Barcode.h
//  rem5
//
//  Created by Ayal Herath on 3/11/15.
//
//

#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>
#import "BarcodeViewController.h"

@interface Barcode : CDVPlugin

@property (nonatomic, strong) BarcodeViewController * barcodeViewController;

- (void)readBarcode:(CDVInvokedUrlCommand*)command;

@end

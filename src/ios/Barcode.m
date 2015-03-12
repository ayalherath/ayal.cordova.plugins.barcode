//
//  Barcode.m
//  rem5
//
//  Created by Ayal Herath on 3/11/15.
//
//

#import "Barcode.h"

@implementation Barcode

NSString *callBackId;

#pragma mark Initialisation functions

- (CDVPlugin*) initWithWebView:(UIWebView*)theWebView {
    self = (Barcode*)[super initWithWebView:theWebView];
    if (self) {
        
    }
    return self;
}

-(void)readBarcode:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        
        callBackId = command.callbackId;
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(populateDataFromPushNotification:)
                                                     name:@"BarcodeRecived"
                                                   object:nil];
        _barcodeViewController = [[BarcodeViewController alloc] init];
        [self.viewController presentViewController:_barcodeViewController animated:YES completion:nil];
    }];
}

-(void)populateDataFromPushNotification:(NSNotification *) notification
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"BarcodeRecived" object:nil];
    // NSString *functionName = [NSString stringWithFormat:@"%@%@%@",@"testInjection('",_barcodeViewController.barcodeNumber,@"');"];
    //[self.webView stringByEvaluatingJavaScriptFromString:functionName];
    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Error adding the reminder"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:callBackId];
    return;
}

@end

//
//  LWCViewController.h
//  Thrift study
//
//  Created by 李伟超 on 14-10-17.
//  Copyright (c) 2014年 LWC. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BulletinBoardClient;

@interface LWCViewController : UIViewController<UITextFieldDelegate> {
    BulletinBoardClient *server;
}

@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UITextView *textView;

- (IBAction)addPressed:(id)sender;

@end

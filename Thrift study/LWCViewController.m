//
//  LWCViewController.m
//  Thrift study
//
//  Created by 李伟超 on 14-10-17.
//  Copyright (c) 2014年 LWC. All rights reserved.
//

#import "TSocketClient.h"
#import "TBinaryProtocol.h"
#import "LWCViewController.h"
#import "idl.h"

@interface LWCViewController ()

@end

@implementation LWCViewController
@synthesize textField;
@synthesize textView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Talk to a server via socket, using a binary protocol
//    TSocketClient *transport = [[TSocketClient alloc] initWithHostname:@"locolhost" port:7911];
    TSocketClient *transport = [[TSocketClient alloc] initWithHostname:@"192.168.16.110" port:8088];
    TBinaryProtocol *protocol = [[TBinaryProtocol alloc] initWithTransport:transport strictRead:YES strictWrite:YES];
    server = [[BulletinBoardClient alloc] initWithProtocol:protocol];
}

- (void)viewDidUnload {
    [self setTextField:nil];
    [self setTextView:nil];
    [super viewDidUnload];
}

- (IBAction)addPressed:(id)sender {
    Message *msg = [[Message alloc] init];
    msg.text = textField.text;
    msg.date = [[NSDate date] description];
    
    [server add:msg];       // send data
    
    NSArray *array = [server get];    // receive data
    NSMutableString *s = [NSMutableString stringWithCapacity:1000];
    for (Message *m in array)
        
        [s appendFormat:@"%@ %@\n", m.date, m.text];
    textView.text = s;
}

- (BOOL)textFieldShouldReturn:(UITextField*)aTextField {
    [aTextField resignFirstResponder];
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end

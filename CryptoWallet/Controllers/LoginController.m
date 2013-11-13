//
//  LoginController.m
//  CryptoWallet
//
//  Created by Alex Doub on 11/5/13.
//  Copyright (c) 2013 Alex Doub. All rights reserved.
//

#import "LoginController.h"

@interface LoginController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@end

@implementation LoginController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.usernameField.delegate = self;
    self.passwordField.delegate = self;

    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped)];
    tapGesture.delegate = self;
    [self.view addGestureRecognizer:tapGesture];
}

- (void) viewTapped
{
    [self.usernameField resignFirstResponder];
    [self.passwordField resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)loginPressed:(id)sender
{
    NSLog(@"Login Pressed");
}

- (IBAction)signupPressed:(id)sender
{
    [self performSegueWithIdentifier:@"goToSignupSegue" sender:self];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];

    CGRect rect = self.view.frame;
    rect.origin.y += 0;
    rect.size.height -= 50;
    self.view.frame = rect;

    [UIView commitAnimations];
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];

    CGRect rect = self.view.frame;
    rect.origin.y -= 0;
    rect.size.height += 50;
    self.view.frame = rect;

    [UIView commitAnimations];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{

    if ([self.usernameField isFirstResponder])
    {
        [self.usernameField resignFirstResponder];
        [self.passwordField becomeFirstResponder];
    }
    else if ([self.passwordField isFirstResponder])
    {
        [self.passwordField resignFirstResponder];
        [self loginPressed:nil];
    }
    return false;
}

@end

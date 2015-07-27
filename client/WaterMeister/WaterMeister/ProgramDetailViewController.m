//
//  ProgramDetailViewViewController.m
//  WaterMeister
//
//  Created by Jason Kelly on 5/16/15.
//  Copyright (c) 2015 Jason Kelly. All rights reserved.
//

#import "ProgramDetailViewController.h"

@interface ProgramDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *programNameTextField;

@end


@implementation ProgramDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    if (self.currentProgram == nil) {
        NSLog(@"Create new program");
        self.currentProgram = [[SprinklerProgram alloc] initWithDefaults];
        self.title = @"New Program";
    } else {
        NSLog(@"Current program: %@", self.currentProgram);
        // set the title of the view
        self.title = [[self.currentProgram name] stringByAppendingString:@" Details"];
    }
    
    // set the program name
    self.programNameTextField.text = [self.currentProgram name];
    
//    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
//    [self.settingTableView addGestureRecognizer:gestureRecognizer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextFieldDelegate Methods

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (IBAction)hideKeyboard:(id)sender {
    [self.programNameTextField endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"textFieldShouldReturn textField is %@", textField);
    [textField resignFirstResponder];
    return YES;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

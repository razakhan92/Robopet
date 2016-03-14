//
//  RBPMainMenuSceneViewController.m
//  RoboPet
//
//  Created by Pat Sluth on 2016-01-21.
//  Copyright © 2016 Pat Sluth. All rights reserved.
//

#import "RBPMainMenuSceneViewController.h"

#import "RBPMainMenuScene.h"
#import "RBPMiniGameSceneViewController.h"
#import "MZFormSheetPresentationViewController.h"

#import "RBPProgressView.h"

#define PADDING 20.0





@interface RBPMainMenuSceneViewController ()
{
}

@property (strong, nonatomic) RBPProgressView *wellnessBar;
@property (strong, nonatomic) RBPProgressView *happinessBar;
@property (strong, nonatomic) RBPProgressView *energyBar;

@end





@implementation RBPMainMenuSceneViewController

#pragma mark - Init

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	[self setupProgressBars];
	[self setupMiniGameButtons];
}

- (void)setupProgressBars
{
	self.wellnessBar = [RBPProgressView wellnessBar];
	[self.view addSubview:self.wellnessBar];
	
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.wellnessBar
														  attribute:NSLayoutAttributeCenterX
														  relatedBy:NSLayoutRelationEqual
															 toItem:self.view
														  attribute:NSLayoutAttributeCenterX
														 multiplier:1.0
														   constant:-200.0]];
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.wellnessBar
														  attribute:NSLayoutAttributeTop
														  relatedBy:NSLayoutRelationEqual
															 toItem:self.view
														  attribute:NSLayoutAttributeTop
														 multiplier:1.0
														   constant:PADDING]];
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.wellnessBar
														  attribute:NSLayoutAttributeWidth
														  relatedBy:NSLayoutRelationEqual
															 toItem:nil
														  attribute:NSLayoutAttributeNotAnAttribute
														 multiplier:1.0
														   constant:175.0]];
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.wellnessBar
														  attribute:NSLayoutAttributeHeight
														  relatedBy:NSLayoutRelationEqual
															 toItem:nil
														  attribute:NSLayoutAttributeNotAnAttribute
														 multiplier:1.0
														   constant:40.0]];
	
	
	self.happinessBar = [RBPProgressView happinessBar];
	[self.view addSubview:self.happinessBar];
	
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.happinessBar
														  attribute:NSLayoutAttributeCenterX
														  relatedBy:NSLayoutRelationEqual
															 toItem:self.view
														  attribute:NSLayoutAttributeCenterX
														 multiplier:1.0
														   constant:0.0]];
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.happinessBar
														  attribute:NSLayoutAttributeTop
														  relatedBy:NSLayoutRelationEqual
															 toItem:self.wellnessBar
														  attribute:NSLayoutAttributeTop
														 multiplier:1.0
														   constant:0.0]];
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.happinessBar
														  attribute:NSLayoutAttributeWidth
														  relatedBy:NSLayoutRelationEqual
															 toItem:self.wellnessBar
														  attribute:NSLayoutAttributeWidth
														 multiplier:1.0
														   constant:0.0]];
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.happinessBar
														  attribute:NSLayoutAttributeHeight
														  relatedBy:NSLayoutRelationEqual
															 toItem:self.wellnessBar
														  attribute:NSLayoutAttributeHeight
														 multiplier:1.0
														   constant:0.0]];
	
	
	self.energyBar = [RBPProgressView energyBar];
	[self.view addSubview:self.energyBar];
	
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.energyBar
														  attribute:NSLayoutAttributeCenterX
														  relatedBy:NSLayoutRelationEqual
															 toItem:self.view
														  attribute:NSLayoutAttributeCenterX
														 multiplier:1.0
														   constant:200.0]];
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.energyBar
														  attribute:NSLayoutAttributeTop
														  relatedBy:NSLayoutRelationEqual
															 toItem:self.wellnessBar
														  attribute:NSLayoutAttributeTop
														 multiplier:1.0
														   constant:0.0]];
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.energyBar
														  attribute:NSLayoutAttributeWidth
														  relatedBy:NSLayoutRelationEqual
															 toItem:self.wellnessBar
														  attribute:NSLayoutAttributeWidth
														 multiplier:1.0
														   constant:0.0]];
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.energyBar
														  attribute:NSLayoutAttributeHeight
														  relatedBy:NSLayoutRelationEqual
															 toItem:self.wellnessBar
														  attribute:NSLayoutAttributeHeight
														 multiplier:1.0
														   constant:0.0]];
}

- (void)setupMiniGameButtons
{
	// Temporary buttons
	UIButton *jumpButton = [[UIButton alloc] init];
	[jumpButton addTarget:self action:@selector(clickedLoadMiniGameButton:) forControlEvents:UIControlEventTouchUpInside];
	jumpButton.translatesAutoresizingMaskIntoConstraints = NO;
	jumpButton.backgroundColor = [UIColor lightGrayColor];
	[jumpButton setTitle:@"Jump" forState:UIControlStateNormal];
	[self.view addSubview:jumpButton];
	
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:jumpButton
														  attribute:NSLayoutAttributeCenterX
														  relatedBy:NSLayoutRelationEqual
															 toItem:self.wellnessBar
														  attribute:NSLayoutAttributeCenterX
														 multiplier:1.0
														   constant:0.0]];
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:jumpButton
														  attribute:NSLayoutAttributeTop
														  relatedBy:NSLayoutRelationEqual
															 toItem:self.wellnessBar
														  attribute:NSLayoutAttributeBottom
														 multiplier:1.0
														   constant:PADDING]];
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:jumpButton
														  attribute:NSLayoutAttributeWidth
														  relatedBy:NSLayoutRelationEqual
															 toItem:self.wellnessBar
														  attribute:NSLayoutAttributeWidth
														 multiplier:1.0
														   constant:0.0]];
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:jumpButton
														  attribute:NSLayoutAttributeHeight
														  relatedBy:NSLayoutRelationEqual
															 toItem:self.wellnessBar
														  attribute:NSLayoutAttributeHeight
														 multiplier:1.0
														   constant:0.0]];
	
	
	
	UIButton *musicButton = [[UIButton alloc] init];
	[musicButton addTarget:self action:@selector(clickedLoadMiniGameButton:) forControlEvents:UIControlEventTouchUpInside];
	musicButton.translatesAutoresizingMaskIntoConstraints = NO;
	musicButton.backgroundColor = [UIColor lightGrayColor];
	[musicButton setTitle:@"Music" forState:UIControlStateNormal];
	[self.view addSubview:musicButton];
	
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:musicButton
														  attribute:NSLayoutAttributeCenterX
														  relatedBy:NSLayoutRelationEqual
															 toItem:self.happinessBar
														  attribute:NSLayoutAttributeCenterX
														 multiplier:1.0
														   constant:0.0]];
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:musicButton
														  attribute:NSLayoutAttributeTop
														  relatedBy:NSLayoutRelationEqual
															 toItem:self.happinessBar
														  attribute:NSLayoutAttributeBottom
														 multiplier:1.0
														   constant:PADDING]];
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:musicButton
														  attribute:NSLayoutAttributeWidth
														  relatedBy:NSLayoutRelationEqual
															 toItem:self.happinessBar
														  attribute:NSLayoutAttributeWidth
														 multiplier:1.0
														   constant:0.0]];
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:musicButton
														  attribute:NSLayoutAttributeHeight
														  relatedBy:NSLayoutRelationEqual
															 toItem:self.happinessBar
														  attribute:NSLayoutAttributeHeight
														 multiplier:1.0
														   constant:0.0]];
	
	
	
	UIButton *rollButton = [[UIButton alloc] init];
	[rollButton addTarget:self action:@selector(clickedLoadMiniGameButton:) forControlEvents:UIControlEventTouchUpInside];
	rollButton.translatesAutoresizingMaskIntoConstraints = NO;
	rollButton.backgroundColor = [UIColor lightGrayColor];
	[rollButton setTitle:@"Roll" forState:UIControlStateNormal];
	[self.view addSubview:rollButton];
	
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:rollButton
														  attribute:NSLayoutAttributeCenterX
														  relatedBy:NSLayoutRelationEqual
															 toItem:self.energyBar
														  attribute:NSLayoutAttributeCenterX
														 multiplier:1.0
														   constant:0.0]];
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:rollButton
														  attribute:NSLayoutAttributeTop
														  relatedBy:NSLayoutRelationEqual
															 toItem:self.energyBar
														  attribute:NSLayoutAttributeBottom
														 multiplier:1.0
														   constant:PADDING]];
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:rollButton
														  attribute:NSLayoutAttributeWidth
														  relatedBy:NSLayoutRelationEqual
															 toItem:self.energyBar
														  attribute:NSLayoutAttributeWidth
														 multiplier:1.0
														   constant:0.0]];
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:rollButton
														  attribute:NSLayoutAttributeHeight
														  relatedBy:NSLayoutRelationEqual
															 toItem:self.energyBar
														  attribute:NSLayoutAttributeHeight
														 multiplier:1.0
														   constant:0.0]];
}

- (void)viewDidLayoutSubviews
{
	[super viewDidLayoutSubviews];
	
	[self.wellnessBar setProgress:self.wellnessBar.progress animated:NO];
	[self.happinessBar setProgress:self.happinessBar.progress animated:NO];
	[self.energyBar setProgress:self.energyBar.progress animated:NO];
}

#pragma mark - RBPMainMenuSceneViewController

- (void)clickedLoadMiniGameButton:(UIButton *)button
{
	NSString *buttonTitle = [button titleForState:UIControlStateNormal];
    RBPMiniGameSceneViewController *miniGameViewController = nil;
    
    if ([buttonTitle isEqualToString:@"Jump"]) {
        miniGameViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"RBPMiniGameSceneViewController_Jump"];
    } else if ([buttonTitle isEqualToString:@"Music"]) {
        miniGameViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"RBPMiniGameSceneViewController_Music"];
    } else if ([buttonTitle isEqualToString:@"Roll"]) {
        miniGameViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"RBPMiniGameSceneViewController_Roll"];
    }
    
    if (miniGameViewController) {
		
		miniGameViewController.delegate = self;
		
		MZFormSheetPresentationViewController *formSheet = [[MZFormSheetPresentationViewController alloc]
															initWithContentViewController:miniGameViewController];
		
		// Full Screen and Centred
		formSheet.presentationController.contentViewSize = self.view.bounds.size;
		formSheet.presentationController.shouldCenterHorizontally = formSheet.presentationController.shouldCenterVertically = YES;
		formSheet.contentViewControllerTransitionStyle =  MZFormSheetPresentationTransitionStyleDropDown;
		
		[self presentViewController:formSheet animated:YES completion:nil];
		
    }
}

#pragma mark - RBPMiniGameSceneViewControllerDelegate

- (void)miniGameDidFinish:(RBPMiniGameSceneViewController *)miniGameViewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - RBPBaseSceneViewController

- (Class)sceneClass;
{
    return [RBPMainMenuScene class];
}

- (NSString *)backgroundImageName
{
	return @"mainmenu_background";
}

#pragma mark - Internal

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end





//
//  EmplesMenuView.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EmplesMenuModelDecorator.h"

@class EmplesMenuPresenter;

@protocol EmplesMenuViewProtocol

-(void) setTableDataSource:(NSArray*)array;

@end

@interface EmplesMenuView : UIViewController <EmplesMenuViewProtocol>

@property (nonatomic, strong) EmplesMenuPresenter *presenter;

@end

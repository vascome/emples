//
//  EmplesMenuController.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesMenuPresenter.h"
#import "EnumMenuSelectedItem.h"
#import <GoogleMaps/GoogleMaps.h>
#define GOOGLE_MAPS_APIKEY @"AIzaSyBq67F_e2PQEWtKgCDDkHBpnVH1r383nQo"

@interface EmplesMenuPresenter () <EmplesMenuSelectProtocol>

@property (nonatomic, strong) EmplesMenuModel *model;
@property (nonatomic, strong) EmplesMenuModelDecorator *decorator;

@end

@implementation EmplesMenuPresenter

-(instancetype)initWithModel:(EmplesMenuModel*)model
{
    self = [super init];
    if (self) {
        self.model = model;
        self.model.delegate = self;
        self.decorator = [[EmplesMenuModelDecorator alloc] initWithModel:self.model];
        [GMSServices provideAPIKey:GOOGLE_MAPS_APIKEY];
    }
    return self;
}


#pragma mark - EmplesMenuRouteProtocol

-(void)selectedItem:(EnumMenuSelectedItem)item;
{
    [self.router navigateToSelectedItem:item];
}

#pragma mark - public

-(void)viewDidLoad
{
    [self.view setTableDataSource:self.decorator.dataSource];
}
@end

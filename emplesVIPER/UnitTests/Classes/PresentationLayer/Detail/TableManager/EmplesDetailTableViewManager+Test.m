//
//  EmplesDetailTableViewManager+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <OCMock/OCMock.h>
#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import "EmplesDetailTableViewManager.h"

SpecBegin(EmplesDetailTableViewManager)

describe(@"EmplesDetailTableViewManager", ^{
    
    context(@"should be created without source", ^{
        __block EmplesDetailTableViewManager *manager;
        
        beforeEach(^{
            
            manager = [[EmplesDetailTableViewManager alloc] initWithSource:@[@2]];
            expect(manager).notTo.beNil();
        });
        
        it(@"should have source and delegate", ^{
            id mock = OCMClassMock([UITableView class]);
            id dataSource = [manager dataSourceForTableView:mock];
            id delegate = [manager delegateForTableView:mock];
            expect(dataSource).notTo.beNil();
            expect(delegate).notTo.beNil();
            
            expect(dataSource).conformTo(@protocol(UITableViewDataSource));
            expect(delegate).conformTo(@protocol(UITableViewDelegate));
            
        });
        
        afterAll(^{
            manager = nil;
        });
    });
});

SpecEnd


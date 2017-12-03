//
//  EmplesDetailAreaModel+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "EmplesDetailAreaModel.h"
#import "EmplesRecreationArea.h"

SpecBegin(EmplesDetailAreaModel)

describe(@"EmplesDetailAreaModel", ^{
    
    __block EmplesDetailAreaModel *area = nil;
    beforeEach(^{
        
        id modelMock = OCMClassMock([EmplesRecreationArea class]);
        OCMStub([modelMock areaName]).andReturn(@"test");
        OCMStub([modelMock areaDescription]).andReturn(@"test");
        OCMStub([modelMock areaDirections]).andReturn(@"test");
        area = [[EmplesDetailAreaModel alloc] initWithItem:modelMock];
    });
    
    it(@"should be exist", ^{
        expect(area).notTo.beNil();
        expect(area.dataSource).notTo.beNil();
        expect([area titleName]).notTo.beNil();
    });
    
    it(@"should have test title", ^{
        expect([area titleName]).to.equal(@"test");
    });
    
    afterAll(^{
        area = nil;
    });
});

SpecEnd


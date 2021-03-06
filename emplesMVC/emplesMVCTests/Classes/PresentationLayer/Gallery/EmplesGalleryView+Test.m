//
//  EmplesGalleryView+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "EmplesGalleryView.h"
#import "EmplesGridCollectionViewManager.h"

@interface EmplesGalleryView(Test)

@property (strong, nonatomic, readonly) UICollectionView *collection;
@property (strong, nonatomic, readonly) EmplesGridCollectionViewManager *sourceManager;

@end
@interface EmplesGalleryView_Test : XCTestCase

@end

@implementation EmplesGalleryView_Test

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGalleryView {
    id modelMock = OCMClassMock([EmplesGridModelDecorator class]);
    EmplesGalleryView *view = [EmplesGalleryView new];
    XCTAssertNotNil(view);
    UINavigationController *vc = [[UINavigationController alloc] initWithRootViewController:view];
    XCTAssertNotNil(vc);
    view.model = modelMock;
    XCTAssertNotNil(view.model);
    XCTAssertNoThrow([view viewDidLoad]);
    XCTAssertNotNil(view.collection);
    XCTAssertNotNil(view.sourceManager);
    XCTAssertNoThrow([view showProgressView]);
    XCTAssertNoThrow([view showData]);
    XCTAssertNoThrow([view hideProgressView]);
    XCTAssertNoThrow([view didReceiveMemoryWarning]);
    
}

@end

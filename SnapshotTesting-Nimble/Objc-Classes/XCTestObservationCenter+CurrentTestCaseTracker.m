#import "XCTestObservationCenter+CurrentTestCaseTracker.h"

#if SWIFT_PACKAGE
    @import SnapshotTesting_Nimble;
#else
    #import <SnapshotTesting_Nimble/SnapshotTesting_Nimble-Swift.h>
#endif

@implementation XCTestObservationCenter (CurrentTestCaseTracker)

+ (void)load {
    [[self sharedTestObservationCenter] addTestObserver:[CurrentCaseTracker shared]];
}

@end

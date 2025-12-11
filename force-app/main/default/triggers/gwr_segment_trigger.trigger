trigger gwr_segment_trigger on Account (before insert, before update) {
    for (Account acc : Trigger.new) {
        acc.gwr_Customer_Segment__c = GWR_SegmentHandler.calculateSegment(acc);
    }
}
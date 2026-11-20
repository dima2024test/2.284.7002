@isTest
private class QA_Fail_Batch_Test {
    @isTest
    static void coversBatch() {
        QA_Fail_Batch b = new QA_Fail_Batch();
        b.start(null);
        Boolean failed = false;
        try {
            b.execute(null, new List<SObject>());
        } catch (QA_Fail_Batch.QA_Fail_Exception e) {
            failed = true;
        }
        b.finish(null);
        System.assert(failed, 'execute() must throw');
    }
}
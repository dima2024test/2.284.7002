/**
 * QA helper (Pharos LOG-3100/3101 testing): batch that always fails in execute()
 * to publish BatchApexErrorEvent for the PEF_Batch_* flows.
 */
public class QA_Fail_Batch implements Database.Batchable<SObject>, Database.RaisesPlatformEvents {
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Id FROM User LIMIT 1');
    }
    public void execute(Database.BatchableContext bc, List<SObject> scope) {
        throw new QA_Fail_Exception('QA-ERR-BATCH: intentional failure to raise BatchApexErrorEvent');
    }
    public void finish(Database.BatchableContext bc) {
        System.debug('QA_Fail_Batch finished');
    }
    public class QA_Fail_Exception extends Exception {}
}
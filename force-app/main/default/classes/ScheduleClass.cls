public class ScheduleClass implements schedulable{

    public void execute(system.SchedulableContext sc){
        BatchClass obj = new BatchClass();
        Id batchJob = Database.executeBatch(obj,10);
    }
}
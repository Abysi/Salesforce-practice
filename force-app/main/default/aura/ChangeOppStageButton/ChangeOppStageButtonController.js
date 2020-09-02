({
  doInit: function(component, event, helper) {
    let recordId = component.get("v.recordId");
    if (recordId == null) return;

    helper.loadRecord(component, recordId);
  },
  changeStage: function(component, event, helper) {
    let action = component.get("c.setOppStageToClose");
    let recordId = component.get("v.recordId");
    if (recordId == null) return;
    action.setParams({ oppId: recordId });
    action.setCallback(this, response => {
      let state = response.getState();
      if (state === "SUCCESS") {
        $A.get("e.force:refreshView").fire();
        helper.loadRecord(component, recordId);
      } else {
        console.log("Failed with state" + state);
      }
    });
    $A.enqueueAction(action);
  }
});
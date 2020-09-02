({
  loadRecord: function(component, oppId) {
    let action = component.get("c.getOpp");
    if (oppId == null) return;
    action.setParams({ oppID: oppId });
    action.setCallback(this, response => {
      let state = response.getState();
      if (state === "SUCCESS") {
        component.set("v.opportunity", response.getReturnValue());
      } else {
        console.log("Failed with state" + state);
      }
    });
    $A.enqueueAction(action);
  }
});
({
    marketUpC : function(component) {
        var action = component.get("c.marketUp");
        action.setCallback(this, function(a){
            var state = a.getState();
            if (state === "SUCCESS") {
                console.log(a);
                $A.get("e.force:showToast").setParams({"type" : "success", "message" : "The market is up, especially SOLR"}).fire();
            } else if (state === "ERROR") {
                console.log(a.getError());
            }
        });
        $A.enqueueAction(action);
    },

    resetC: function (component) {
        var action = component.get("c.reset");
        action.setCallback(this, function (a) {
            var state = a.getState();
            if (state === "SUCCESS") {
                console.log(a);
                $A.get("e.force:showToast").setParams({ "type": "success", "message": "Reset complete!" }).fire();
            } else if (state === "ERROR") {
                console.log(a.getError());
            }
        });
        $A.enqueueAction(action);
    }
})

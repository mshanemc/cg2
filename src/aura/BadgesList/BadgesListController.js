({
    doInit : function(component) {
        console.log('init is initing');
        var action = component.get("c.getBadges");
        action.setParams({
            customerId : component.get("v.recordId")
        });
        action.setCallback(this, function(a){
            var state = a.getState();
            if (state === "SUCCESS") {
                console.log(a.getReturnValue());
                component.set("v.badges", a.getReturnValue());
            } else if (state === "ERROR") {
                console.log(a.getError());
            }
        });
        $A.enqueueAction(action);
    }
})

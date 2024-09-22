state("Dorfromantik")
{
    int score: "mono-2.0-bdwgc.dll", 0x0084B9A0, 0x148, 0x30, 0x100;
}

startup{
    settings.Add("splitpoints", true, "Split on particular point (Only check one value or highest will be used)");
    settings.Add("twok", true, "2000 Points", "splitpoints");
    settings.Add("fivek", false, "5000 Points", "splitpoints");
    settings.Add("tenk", false, "10000 Points", "splitpoints");
    settings.Add("t5k", false, "25000 Points", "splitpoints");
    settings.Add("splitOnAll", true, "Splits on all Points (If checked above will be ignored)");
}



start{
    if(current.score > 0 && old.score == 0){
        if(settings["splitOnAll"]){
            vars.currentGoal = 2000;
        }
        return true;
    }
}

init {
        vars.currentGoal = 2000;
        if(settings["splitOnAll"]){
            return;
        }
        if (settings["fivek"]){
            vars.currentGoal = 5000;
        }
        if (settings["tenk"]){
            vars.currentGoal = 10000;
        }
        if (settings["t5k"]){
            vars.currentGoal = 25000;
        }
}

split{
    
    
    if(settings["splitOnAll"]){
        if(current.score >= vars.currentGoal){
            if(vars.currentGoal == 2000){
                vars.currentGoal = 5000;
            }else if(vars.currentGoal == 5000){
                vars.currentGoal = 10000;
            }else if(vars.currentGoal == 10000){
                vars.currentGoal = 25000;
            }else{
                vars.currentGoal = 2000;
            }
            return true;
        }
        return false;
    }

    if (current.score >= vars.currentGoal){
        return true;
    }
    
}

reset{
    if(current.score == 0 && old.score > 0){
    
        return true;
    }
}

state("Dorfromantik")
{
    int score: "mono-2.0-bdwgc.dll", 0x0084B9D0, 0x20, 0x90, 0x300;
}

startup{
    settings.Add("splitpoints", true, "Split on points (Only check one value or lowest will be used)");
    settings.Add("twok", true, "2000 Points", "splitpoints");
    settings.Add("fivek", false, "5000 Points", "splitpoints");
    settings.Add("tenk", false, "10000 Points", "splitpoints");
    settings.Add("t5k", false, "25000 Points", "splitpoints");
}

start{

    if(current.score > 0 && old.score == 0){
        return true;
    }

}

split{
    
    int pointGoal = 2000;
    if (settings["fivek"]){
        pointGoal = 5000;
    }
    if (settings["tenk"]){
        pointGoal = 10000;
    }
    if (settings["t5k"]){
        pointGoal = 25000;
    }
    if (current.score >= pointGoal){
        return true;
    }

    
}

reset{
    if(current.score == 0 && old.score > 0){
        return true;
    }
}

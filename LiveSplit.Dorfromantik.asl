state("Dorfromantik")
{
    int score: "mono-2.0-bdwgc.dll", 0x00716040, 0x90, 0xB0, 0x40, 0x4EC;
}

startup{
    settings.Add("splitpoints", true, "Split on points (Only check one value or lowest will be used)");
    settings.Add("twok", true, "2000 Points", "splitpoints");
    settings.Add("fivek", false, "5000 Points", "splitpoints");
    settings.Add("tenk", false, "10000 Points", "splitpoints");
    settings.Add("t5k", false, "25000 Points", "splitpoints");
}

start{
    // Score = 0 is a new game, timer starts when first piece is placed
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
    
    // If the score is reached, then split (or rather just stop the timer because it only has a single split)
    if (current.score >= pointGoal){
        return true;
    }
    
}

reset{
    // If the score suddenly drops to 0, then a new game is created which is a game reset
    if(current.score == 0 && old.score > 0){
        return true;
    }
}

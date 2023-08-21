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

    print("Current score: " + current.score);
    print("Old score: " + old.score);
    if(current.score > 0 && old.score == 0){
        return true;
    }

}

split{
    print("Current score: " + current.score);
    print("Old score: " + old.score);
    if(current.score > 20){
        return true;
    }
}

reset{
        if(current.score == 0 && old.score > 0){
        return true;
    }
}
